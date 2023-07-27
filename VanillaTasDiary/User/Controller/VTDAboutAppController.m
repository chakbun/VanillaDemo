//
//  VTDAboutAppController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDAboutAppController.h"
#import "Masonry.h"
#import "VTDWebController.h"

@interface VTDAboutAppController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *itemTableView;

@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation VTDAboutAppController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于";
    
    self.itemArray = @[@"用户协议", @"隐私协议"];
    
    UIView *headerView = [[UIView alloc] init];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(20);
        make.trailing.equalTo(self.view).offset(-20);
        make.top.equalTo(self.view).offset(20);
        make.height.mas_equalTo(200);
    }];
    
    float iconHeight = 76;
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"about_app_icon"]];
    [headerView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(iconHeight, iconHeight));
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(32);
    }];
    
    UILabel *versionLabel = [[UILabel alloc] init];
    versionLabel.textColor = UIColor.lightTextColor;
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.text = [NSString stringWithFormat:@"当前版本:%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    versionLabel.font = [UIFont systemFontOfSize:12.f];
    [headerView addSubview:versionLabel];
    [versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(headerView).offset(20);
        make.trailing.equalTo(headerView).offset(-20);
        make.top.equalTo(iconView.mas_bottom).offset(8);
        make.height.mas_equalTo(20);
    }];
    
    self.itemTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.itemTableView.backgroundColor = [UIColor whiteColor];
    self.itemTableView.scrollEnabled = NO;
    self.itemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.itemTableView];
    self.itemTableView.tableFooterView = [UIView new];
    [self.itemTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.itemTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(versionLabel.mas_bottom).offset(15);
        make.leading.equalTo(self.view).offset(12);
        make.trailing.equalTo(self.view).offset(-12);
        make.height.mas_equalTo(100);
    }];
    
    self.itemTableView.dataSource = self;
    self.itemTableView.delegate = self;
    self.itemTableView.layer.cornerRadius = 10;
    self.itemTableView.layer.masksToBounds = YES;
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
    
    [[cell viewWithTag:1001] removeFromSuperview];
    [[cell viewWithTag:1000] removeFromSuperview];

    if(indexPath.row == 1){
        UILabel *emailLabel = [[UILabel alloc] init];
        emailLabel.text = @"poushengyin@163.com";
        emailLabel.font = [UIFont systemFontOfSize:14.f];
        emailLabel.textColor = UIColor.blackColor;
        emailLabel.tag = 1001;
        [cell.contentView addSubview:emailLabel];
        [emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(cell.contentView).offset(-17.5);
            make.centerY.height.equalTo(cell.contentView);
        }];
    }else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row != self.itemArray.count - 1) {
        UIView *lineView = [[UIView alloc] init];
        lineView.tag = 1000;
        lineView.backgroundColor = UIColor.blackColor;
        [cell.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.5);
            make.leading.equalTo(cell.contentView).offset(20);
            make.trailing.equalTo(cell.contentView).offset(-20);
            make.bottom.equalTo(cell.contentView);
        }];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
//        [self go2PolicyWebPage];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end

