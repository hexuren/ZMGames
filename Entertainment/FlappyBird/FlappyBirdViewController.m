//
//  FlappyBirdViewController.m
//  Entertainment
//
//  Created by Zhimi on 2017/11/3.
//  Copyright © 2017年 kevinwu. All rights reserved.
//

#import "FlappyBirdViewController.h"
#import "NewGameScene.h"

@interface FlappyBirdViewController ()

@end

@implementation FlappyBirdViewController

- (void)loadView
{
    self.view  = [[SKView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"笨鸟先飞";
    [self enableAutoBack];
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    SKView *skView = (SKView *)[self view];
    [skView setShowsFPS:YES];
    [skView setShowsNodeCount:YES];
    
    SKScene *scene = [NewGameScene sceneWithSize:skView.bounds.size];
    [scene setScaleMode:SKSceneScaleModeAspectFill];
    
    [skView presentScene:scene];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
