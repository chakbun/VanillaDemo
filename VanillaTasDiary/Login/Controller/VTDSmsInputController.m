//
//  VTDSmsInputController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDSmsInputController.h"
#import "PasswordGridView.h"
#import "Masonry.h"
#import "VTDHomeTabbarController.h"
#import "ILoginProtocol.h"
#import "SVProgressHUD.h"

@interface VTDSmsInputController ()<PasswordGridViewDelegate>

@property (nonatomic, strong) UILabel *smsTipsLabel;
@property (nonatomic, strong) PasswordGridView *passwordGridView;
@property (nonatomic, strong) UILabel *reSmsTipsLabel;

@end

@implementation VTDSmsInputController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.4];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.smsTipsLabel = [[UILabel alloc] init];
    self.smsTipsLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:self.smsTipsLabel];
    [self.smsTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_offset(20);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(100);
    }];

    [self.view addSubview:self.passwordGridView];
    [self.passwordGridView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.smsTipsLabel.mas_bottom).offset(40.f);
        make.left.mas_equalTo(self.smsTipsLabel);
        make.height.mas_equalTo(45.f);
        make.trailing.mas_equalTo(-20);
    }];
    
    self.reSmsTipsLabel = [[UILabel alloc] init];
    self.reSmsTipsLabel.text = @"重新获取验证码";
    self.reSmsTipsLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:self.reSmsTipsLabel];
    [self.reSmsTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(31.f);
        make.left.mas_equalTo(self.passwordGridView);
        make.top.mas_equalTo(self.passwordGridView.mas_bottom).offset(20.f);
    }];
    
    [self updateSmsTipsLabelText];
}

- (void)setPhone:(NSString *)phone {
    _phone = phone;
}

- (void)updateSmsTipsLabelText {
    NSString *displayPhone = self.phone;
    if (self.phone.length >= 7) {
        displayPhone = [displayPhone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    self.smsTipsLabel.text = [NSString stringWithFormat:@"已向 %@ 发送验证码", displayPhone];
}

- (void)passwordGridView:(UIView *)passwordGridView didChangeWithCode:(NSString *)code {
    
}

- (void)passwordGridView:(UIView *)passwordGridView didFillfullWithCode:(NSString *)code {
    __weak typeof(self) weakSelf = self;
    [SVProgressHUD showWithStatus:@""];
    [ZYGService(ILoginService) loginWithPhone:self.phone countryPhoneCode:self.areaCode smsCode:code successBlock:^{
        [SVProgressHUD dismiss];
        [weakSelf go2HomeTabBarPage];
    } failBlock:^(NSString *errorMsg) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:errorMsg];
    }];
}


- (PasswordGridView *)passwordGridView {
    if (!_passwordGridView) {
        _passwordGridView = [[PasswordGridView alloc] init];
        _passwordGridView.delegate = self;
        _passwordGridView.numberCount = 6;
        _passwordGridView.gridTextFont = [UIFont fontWithName:@"DIN-Bold" size:30.f];
        UIColor *textColor = [UIColor hx_colorWithHexString:@"#FFFFFF"];
        _passwordGridView.gridTextColor = textColor;
        _passwordGridView.gridBackgroundColor = [textColor colorWithAlphaComponent:0.16];

    }
    return _passwordGridView;
}

- (void)go2HomeTabBarPage {
    VTDHomeTabbarController *tabbarController = [[VTDHomeTabbarController alloc] init];
    UIApplication.sharedApplication.keyWindow.rootViewController = tabbarController;
}

@end
