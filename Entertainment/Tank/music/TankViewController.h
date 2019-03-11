//
//  TankViewController.h
//  Entertainment
//
//  Created by Zhimi on 2017/11/3.
//  Copyright © 2017年 kevinwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TankViewController : UIViewController
/*
 *  游戏暂停
 */
+ (void)pauseGame;

/*
 *  重新开始
 */
- (void)restart;

+ (void)stopBadTankIn6s;

@end
