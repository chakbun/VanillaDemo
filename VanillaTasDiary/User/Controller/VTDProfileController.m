//
//  VTDProfileController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDProfileController.h"
#import "Masonry.h"
#import "VTDSettingsController.h"
#import "VTDAboutAppController.h"
#import "VTDFeedBackController.h"
#import "VTDProfileEditController.h"

@interface VTDProfileController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *itemTableView;

@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation VTDProfileController

- (void)initViewsLayout {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(12);
        make.leading.equalTo(self.view).offset(12);
        make.trailing.equalTo(self.view).offset(-12);
        make.height.mas_equalTo(85);
    }];
    
    self.itemTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.itemTableView.backgroundColor = [UIColor whiteColor];
    self.itemTableView.scrollEnabled = NO;
    self.itemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.itemTableView];
    self.itemTableView.tableFooterView = [UIView new];
    [self.itemTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.itemTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_bottom).offset(8);
        make.leading.equalTo(self.view).offset(12);
        make.trailing.equalTo(self.view).offset(-12);
        make.bottom.equalTo(self.view).offset(-100);
    }];
    
    self.itemTableView.dataSource = self;
    self.itemTableView.delegate = self;
    self.itemTableView.layer.cornerRadius = 10;
    self.itemTableView.layer.masksToBounds = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.itemArray = @[
        @"修改资料",
        @"意见反馈",
        @"关于日记",
        @"设置",
    ];
    [self initViewsLayout];
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
    if (indexPath.row == 3) {
        VTDSettingsController *settingsController = [[VTDSettingsController alloc] init];
        [self.navigationController pushViewController:settingsController animated:YES];
    }else if (indexPath.row == 2) {
        VTDAboutAppController *vc = [[VTDAboutAppController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        VTDFeedBackController *vc = [[VTDFeedBackController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 0) {
        VTDProfileEditController *vc = [[VTDProfileEditController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

@end
