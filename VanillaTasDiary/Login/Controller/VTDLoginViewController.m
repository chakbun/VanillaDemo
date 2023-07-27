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
#import "CountryListController.h"
#import "Masonry.h"
#import "SVProgressHUD.h"
#import "VTDSmsInputController.h"

@interface VTDLoginViewController ()<CountryListControllerDelegate>

@property (nonatomic, strong) UIButton *smsButton;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, copy) NSString *areaCode;

@end

@implementation VTDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.areaCode = @"86";

    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.4];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AppIcon"]];
    [self.view addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(200);
    }];
    
    self.phoneTextField = [[UITextField alloc] init];
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextField.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(20);
        make.trailing.mas_equalTo(-20);
        make.top.equalTo(iconView.mas_bottom).offset(20);
        make.height.mas_equalTo(50);
    }];
    
    self.smsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.smsButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.smsButton addTarget:self action:@selector(didSmsButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.smsButton];
    [self.smsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(100);
        make.trailing.mas_equalTo(-100);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(20);
    }];
    
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

- (void)didSmsButtonClicked:(UIButton *)button {
    if (self.phoneTextField.text.length > 0) {
        __weak typeof(self) weakSelf = self;
        [SVProgressHUD showWithStatus:@""];
        [ZYGService(ILoginService) smsCodeWithPhone:self.phoneTextField.text countryPhoneCode:self.areaCode smsType:kLoginSmsTypeLogin successBlock:^{
            [SVProgressHUD dismiss];
            NSLog(@"[smsCodeWithPhone]success");
            VTDSmsInputController *vc = [[VTDSmsInputController alloc] init];
            vc.phone = weakSelf.phoneTextField.text;
            vc.areaCode = weakSelf.areaCode;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        } failBlock:^(NSString *errorMsg, NSInteger errorCode) {
            NSLog(@"[smsCodeWithPhone]failed, errorMsg:%@, errorCode:%@", errorMsg, @(errorCode));
            [SVProgressHUD dismiss];
        }];
    }
}

- (void)longLinkSuccess:(NSNotification *)notification {
    [self go2HomeTabBarPage];
}

- (void)go2HomeTabBarPage {
    VTDHomeTabbarController *tabbarController = [[VTDHomeTabbarController alloc] init];
    UIApplication.sharedApplication.keyWindow.rootViewController = tabbarController;
}

- (void)go2CountryListController {
    CountryListController *vc = [[CountryListController alloc] init];
    vc.title = @"选择国家和地区";
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)countryInforSelected:(NSDictionary *)inforDict {
    NSLog(@"[countryInforSelected]infoDict:%@", inforDict);
}

@end
