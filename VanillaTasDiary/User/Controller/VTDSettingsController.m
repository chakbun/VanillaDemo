//
//  VTDSettingsController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDSettingsController.h"
#import "Masonry.h"
#import "VTDWebController.h"
#import "ILoginProtocol.h"
#import "VTDLoginViewController.h"

@interface VTDSettingsController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *itemTableView;

@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation VTDSettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.itemArray = @[
        @"退出登录",
        @"注销账号",
    ];
    self.itemTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.itemTableView.backgroundColor = [UIColor whiteColor];
    self.itemTableView.scrollEnabled = NO;
    self.itemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.itemTableView];
    self.itemTableView.tableFooterView = [UIView new];
    [self.itemTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.itemTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.leading.equalTo(self.view).offset(12);
        make.trailing.equalTo(self.view).offset(-12);
        make.bottom.equalTo(self.view).offset(-100);
    }];
    
    self.itemTableView.dataSource = self;
    self.itemTableView.delegate = self;
    self.itemTableView.layer.cornerRadius = 10;
    self.itemTableView.layer.masksToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.itemArray[indexPath.row];
    cell.textLabel.textColor = UIColor.blackColor;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        VTDWebController *webController = [[VTDWebController alloc] init];
        webController.url = [NSURL URLWithString:@"https://www.163.com"];
        [self.navigationController pushViewController:webController animated:YES];
    }else if(indexPath.row == 0) {
        //退出登录
        [ZYGService(ILoginService) logout];
        VTDLoginViewController *loginController = [[VTDLoginViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginController];
        UIApplication.sharedApplication.keyWindow.rootViewController = navController;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

@end
