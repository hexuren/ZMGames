//
//  AppDelegate.m
//  Entertainment
//
//  Created by Zhimi on 2017/11/2.
//  Copyright © 2017年 kevinwu. All rights reserved.
//

#import "AppDelegate.h"

#import "EAIntroView.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "RDVTabBarController+CenterButton.h"
#import "iAppInfos.h"
#import "HomePageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self showTabViewControllersAnimated:NO];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UtilityMethod

- (void)showTabViewControllersAnimated:(BOOL)animate{
    RDVTabBarController *tabBarController = [self configureTabBarController];
    tabBarController.selectedIndex = 0;
    if (animate) {
        UIView *overlayView = [[UIScreen mainScreen] snapshotViewAfterScreenUpdates:NO];
        [tabBarController.view addSubview:overlayView];
        self.window.rootViewController = tabBarController;
        [UIView animateWithDuration:0.65 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            overlayView.alpha = 0;
        } completion:^(BOOL finished) {
            [overlayView removeFromSuperview];
        }];
    }
    else{
        self.window.rootViewController = tabBarController;
        //        HomeTableViewController *vc = [HomeTableViewController new];
        //        HRNavigationController *navVC = [[HRNavigationController alloc] initWithRootViewController:vc];
        //        self.window.rootViewController = navVC;
    }
}

- (RDVTabBarController *)configureTabBarController{
    RDVTabBarController *tabBarController = [RDVTabBarController new];
        tabBarController.delegate = self;
        tabBarController.tabBar.height = 0.1;
    
        UINavigationController *firstNavVC = nil;
        NSString *firstTitle = nil;
        firstTitle = @"欢迎收听";
        HomePageViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomePageViewController"];
        firstNavVC = [[UINavigationController alloc] initWithRootViewController:controller];
        firstNavVC.navigationBar.barTintColor = gMainColor;
        [tabBarController setViewControllers:@[firstNavVC]];
    
    NSArray *title = @[firstTitle];
    
    NSString *secondImageTitle = @"bottom_contact";
    NSString *thirdImageTitle = @"bottom_application";
    if (IsParent_APP) {
        secondImageTitle = @"bottom_kids";
        thirdImageTitle = @"bottom_find";
    }
    NSArray *imageNames = @[@"bottom_message", secondImageTitle,thirdImageTitle,@"bottom_mine"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        if (index == 0) {
            //            NSInteger unread = [[EaseMob sharedInstance].chatManager loadTotalUnreadMessagesCountFromDatabase];
            //            if (unread > 0) {
            //                item.badgeValue = [NSString stringWithFormat:@"%ld", unread];
            //            }
            //            else{
            //                item.badgeValue = nil;
            //            }
        }
        
        item.title = title[index];
        item.tintColor = gTextColorMain;
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName : gMainColor,
                                         NSFontAttributeName : gFontSub12};
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName : gTextColorMain,
                                           NSFontAttributeName : gFontSub12};
        NSString *fileName = imageNames[index];
        
        UIImage *normalImage = [UIImage imageNamed:fileName];
        UIImage *selectedImage = [UIImage imageNamed:[fileName stringByAppendingString:@"_on"]];
        item.titlePositionAdjustment = UIOffsetMake(0, 5);
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        
        index ++;
    }
    
    return tabBarController;
}

#pragma mark - RDVTabBarControllerDelegate

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
//    if (index == 4) {
//
//    }
    return YES;
}

@end
