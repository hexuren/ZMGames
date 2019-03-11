//
//  HomePageViewController.m
//  Entertainment
//
//  Created by Zhimi on 2017/11/2.
//  Copyright © 2017年 kevinwu. All rights reserved.
//

#import "HomePageViewController.h"
#import "TetrisViewController.h"
#import "SKViewController.h"
#import "SaoleiViewController.h"
#import "M2ViewController.h"
#import "FlappyBirdViewController.h"
#import "RootViewController.h"
#import "TankViewController.h"

@interface HomePageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *snakeButton;

@property (weak, nonatomic) IBOutlet UIButton *flashlightButton;
@property (weak, nonatomic) IBOutlet UIButton *tetrisButton;
@property (weak, nonatomic) IBOutlet UIButton *playPlaneButton;
@property (weak, nonatomic) IBOutlet UIButton *sweepButton;
@property (weak, nonatomic) IBOutlet UIButton *twoZeroButton;
@property (weak, nonatomic) IBOutlet UIButton *flapBirdButton;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"ZMGames";
    [_flashlightButton.layer setMasksToBounds:YES];
    [_flashlightButton.layer setCornerRadius:8.0];
    [_tetrisButton.layer setMasksToBounds:YES];
    [_tetrisButton.layer setCornerRadius:8.0];
    [_playPlaneButton.layer setMasksToBounds:YES];
    [_playPlaneButton.layer setCornerRadius:8.0];
    [_sweepButton.layer setMasksToBounds:YES];
    [_sweepButton.layer setCornerRadius:8.0];
    [_snakeButton.layer setMasksToBounds:YES];
    [_snakeButton.layer setCornerRadius:8.0];
    [_twoZeroButton.layer setMasksToBounds:YES];
    [_twoZeroButton.layer setCornerRadius:8.0];
    [_flapBirdButton.layer setMasksToBounds:YES];
    [_flapBirdButton.layer setCornerRadius:8.0];
    
}


-(void)turnTorchOn: (bool) on{
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass !=nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            [device lockForConfiguration:nil];
            if (on) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
            }
            [device unlockForConfiguration];
        }else{
            NSLog(@"初始化失败");
        }
    }else{
        NSLog(@"没有闪光设备");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtonClickAction
- (IBAction)onClickSnakeButton:(id)sender {
    TankViewController *controller = [TankViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickFlashlightButton:(id)sender {
    _flashlightButton.selected = !_flashlightButton.selected;
    [self turnTorchOn:_flashlightButton.selected];
    
}
- (IBAction)onClickTetrisButton:(id)sender {
    TetrisViewController *controller = [TetrisViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onClickPlayPlaneButton:(id)sender {
    SKViewController *controller = [[UIStoryboard storyboardWithName:@"SKViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"SKViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onClickSweepButton:(id)sender {
    SaoleiViewController *controller = [SaoleiViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onClickTwoZeroButton:(id)sender {
    M2ViewController *controller = [[UIStoryboard storyboardWithName:@"2048" bundle:nil] instantiateViewControllerWithIdentifier:@"M2ViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)onClickFlapBirdButton:(id)sender {
    FlappyBirdViewController *controller = [FlappyBirdViewController new];
    [self.navigationController pushViewController:controller animated:YES];
    
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
