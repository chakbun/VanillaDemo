//
//  CountryListController.h
//  GDLiveStreaming
//
//  Created by 
//  Copyright © 2016年 Larry Tin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryTableViewCell.h"

@protocol CountryListControllerDelegate <NSObject>

- (void)countryInforSelected:(NSDictionary *) inforDict;//选择信息

@end


@interface CountryListController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableDictionary * filterDictionary;//保存过滤数据
@property (nonatomic, strong) NSMutableDictionary * nameDictionary;//保存名字

@property (nonatomic, weak) id<CountryListControllerDelegate> delegate;

@end


