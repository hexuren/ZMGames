//
//  RootViewController.m
//  XMAdvGame
//
//  Created by Gordon on 15/7/27.
//  Copyright (c) 2015年 Gordon. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize mvc = _mvc;
@synthesize gvc = _gvc;

+ (RootViewController *) shareInstance
{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小明快跑";
    [self enableAutoBack];
    self.mvc = [[MenuViewController alloc] init];
    [self.view addSubview:_mvc.view];
    self.gvc = [[GameViewController alloc] init];
}

@end
