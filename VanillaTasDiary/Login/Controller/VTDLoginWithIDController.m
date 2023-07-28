//
//  VTDLoginWithIDController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/26.
//

#import "VTDLoginWithIDController.h"
#import "Masonry.h"
#import <ZygoteServiceCenter/ZYGServiceCenter.h>
#import "ILoginProtocol.h"

@interface VTDLoginWithIDController ()

@property (nonatomic, strong) UITextField *idTextfield;

//@property (nonatomic, strong) UITextField *pswTextfield;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation VTDLoginWithIDController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.idTextfield = [[UITextField alloc] init];
//    self.pswTextfield = [[UITextField alloc] init];
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:self.idTextfield];
//    [self.view addSubview:self.pswTextfield];
    [self.view addSubview:self.loginButton];
    
    [self.idTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(20);
        make.trailing.mas_equalTo(-20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    self.idTextfield.layer.cornerRadius = 25;
    self.idTextfield.layer.masksToBounds = YES;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    self.idTextfield.leftView = leftView;
    self.idTextfield.leftViewMode = UITextFieldViewModeAlways;

    
//    [self.pswTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.height.equalTo(self.idTextfield);
//        make.top.equalTo(self.idTextfield.mas_bottom).offset(10);
//    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(50);
        make.trailing.mas_equalTo(-50);
        make.top.equalTo(self.idTextfield.mas_bottom).offset(50);
        make.height.mas_equalTo(44);
    }];
    self.loginButton.layer.cornerRadius = 22;
    self.loginButton.layer.masksToBounds = YES;
    [self.loginButton addTarget:self action:@selector(didLoginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.mode == 1) {
        self.title = @"万能登录";
        self.view.backgroundColor = UIColor.lightGrayColor;
        self.idTextfield.backgroundColor = UIColor.whiteColor;
        self.idTextfield.placeholder = @"用户名";
//        self.pswTextfield.backgroundColor = UIColor.whiteColor;
        [self.loginButton setBackgroundColor:UIColor.redColor];
        [self.loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [self.loginButton setTitle:@"万能登录" forState:UIControlStateNormal];
    }
}

- (void)didLoginButtonClicked:(UIButton *)button {
    if (self.mode == 1) {
        NSString *authName = self.idTextfield.text;
        [ZYGService(ILoginService) getAccountToken:authName];
        return;
    }
}

@end
