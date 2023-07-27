//
//  VTDLoginViewController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/26.
//

#import "VTDLoginViewController.h"
#import <BlocksKit/UIGestureRecognizer+BlocksKit.h>
#import "VTDLoginWithIDController.h"
#import "ILoginProtocol.h"
#import "VTDHomeTabbarController.h"

@interface VTDLoginViewController ()

@end

@implementation VTDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(longLinkSuccess:) name:kLongLinkSuccessNotification object:nil];

#ifdef DEBUG
    __weak typeof(self) weakSelf = self;
    UITapGestureRecognizer *doubleTap =[UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        VTDLoginWithIDController *vc = [[VTDLoginWithIDController alloc] init];
        vc.mode = 1;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
#endif
}

- (void)longLinkSuccess:(NSNotification *)notification {
    [self go2HomeTabBarPage];
}

- (void)go2HomeTabBarPage {
    VTDHomeTabbarController *tabbarController = [[VTDHomeTabbarController alloc] init];
    UIApplication.sharedApplication.keyWindow.rootViewController = tabbarController;
}

@end
