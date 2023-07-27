//
//  CountryListController.m
//  GDLiveStreaming
//
//  Created by 
//  Copyright © 2016年 Larry Tin. All rights reserved.
//

#import "CountryListController.h"
#import "CountryInformation.h"
#import <ZygoteFoundation/PinYin4Objc.h>
#import "AppDelegate.h"
#import <ZygoteFoundation/pinyin.h>
#import "Masonry.h"
#import <BlocksKit/UIControl+BlocksKit.h>

#define DEFAULTKEYS [self.nameDictionary.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]
#define FILTEREDKEYS [self.filterDictionary.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]


#define ALPHA	@"ABCDEFGHIJKLMNOPQRSTUVWXYZ#"

#define ALPHA_ARRAY [NSArray arrayWithObjects: @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",@"#", nil]

static NSString * const kCountryListCellIdentify = @"kCountryListCellIdentify";

NSString * const kCountryListDidLoad = @"CountryListDidLoad";

NSString * const kCountryListWillDisappear = @"CountryListWillDisappear";

@interface CountryListController ()
<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate
>
{
    NSMutableArray *mutTableArray;//保存表视图数据
    
    BOOL isSearch;//Yes--搜索情况下
}

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation CountryListController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [NSNotificationCenter.defaultCenter postNotificationName:kCountryListWillDisappear object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"选择国家和地区";

    [self backButton];
    
    [self tipLabel];
    
    [self searchBar];
    
    [self.tableView registerClass:CountryTableViewCell.class
           forCellReuseIdentifier:kCountryListCellIdentify];
    
    mutTableArray = [NSMutableArray array];
    self.nameDictionary = [NSMutableDictionary dictionary];
    self.filterDictionary = [NSMutableDictionary dictionary];
    [self prepaerData];
    
    [NSNotificationCenter.defaultCenter postNotificationName:kCountryListDidLoad object:nil];
    
}


//准备数据
- (void) prepaerData{
    CountryInformation *coutry=[CountryInformation shareCountryInformation];
    NSDictionary *phoneCode=coutry.phoneCodeDictonary;
    for (NSString *key in phoneCode) {
        NSString *code=phoneCode[key];
        NSString *name=coutry.countryNameDictonary[key];
        if (name==nil) {
            name=@"";
            continue;
        }
        NSDictionary *dict=@{@"name":name,@"code":code,@"countryKey":key};
        [mutTableArray addObject:dict];
        
    }
    [self addDataWithSouces:mutTableArray dicc:self.nameDictionary];
    [self.tableView reloadData];
    
}


//根据名字的首字母分组
-(void)addDataWithSouces:(NSArray *)arrays dicc:(NSMutableDictionary *)diccs
{
    
    if (diccs.allKeys.count != 0) {
        [diccs removeAllObjects];
    }
    
    NSMutableArray *sortList = [NSMutableArray arrayWithArray:ALPHA_ARRAY];
    [sortList insertObject:kCountryInformationHotPrefix atIndex:0];
    
    for (NSString *string in sortList)
    {
        BOOL isHotRegion = [string hasPrefix:kCountryInformationHotPrefix];
        NSMutableArray *array = [NSMutableArray array];
        BOOL realexist = NO;
        for (NSDictionary *dict in arrays) {
            /*获取当前语言环境*/
            NSString *stringname = [self namToPinYinFisrtNameWith:dict[@"name"]];
            if (isHotRegion) {
                if ([dict[@"countryKey"] hasPrefix:kCountryInformationHotPrefix]) {
                    [array addObject:dict];
                    realexist = YES;
                }
            }
            else {
                if ([dict[@"countryKey"] hasPrefix:kCountryInformationHotPrefix]) {
                    
                }
                else if ([stringname hasPrefix:[string lowercaseString]]) {
                    [array addObject:dict];
                    realexist = YES;
                }
                else if ([dict[@"name"] hasPrefix:string ]) {
                    [array addObject:dict];
                    realexist = YES;
                }
            }
        }
        if (realexist) {
            //            NSArray *newArr=[array sortedArrayUsingSelector:@selector(compare:)];
            NSArray *newArr=[array sortedArrayUsingFunction:nickNameSort context:NULL];
            
            //            [diccs setObject:array forKey:string];
            [diccs setObject:newArr forKey:string];
        }
    }
    // DYLogInfo(@"%@",self.filterDictionary);
    [self.tableView reloadData];
}

//将名字转成拼音
-(NSString *)namToPinYinFisrtNameWith:(NSString *)name
{

    NSString * outputString = @"";
    for (int i =0; i<[name length]; i++) {
        outputString = [NSString stringWithFormat:@"%@%c",outputString,xhx_pinyinFirstLetter([name characterAtIndex:i])];
        
        
        
    }
    
    if ([outputString hasPrefix:@"#"]) {
        outputString=@"#";
    }
    
    return outputString;
}

//将名字转成拼音
-(NSString *)nameToPinYinWith:(NSString *)name {
    HanyuPinyinOutputFormat *outputFormat=[[HanyuPinyinOutputFormat alloc] init];
    [outputFormat setToneType:ToneTypeWithoutTone];
    [outputFormat setVCharType:VCharTypeWithV];
    [outputFormat setCaseType:CaseTypeLowercase];
    NSString *outputPinyin=[PinyinHelper toHanyuPinyinStringWithNSString:name withHanyuPinyinOutputFormat:outputFormat withNSString:@""];
    return outputPinyin;
}

//根据名字排列
NSInteger nickNameSort(id user1, id user2, void *context){
    NSDictionary *u1,*u2;
    //类型转换
    u1 = (NSDictionary*)user1;
    u2 = (NSDictionary*)user2;
    return  [u1[@"name"] localizedCompare:u2[@"name"]
             ];
}




#pragma mark -- 搜索相关
-(BOOL)searchResult:(NSString *)contactName searchText:(NSString *)searchT{
    if (contactName==nil || searchT == nil || [contactName isKindOfClass:[NSNull class]]==YES) {
        return NO;
    }
    //字符串比较
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    NSRange productNameRange = NSMakeRange(0, contactName.length);
    NSRange foundRange = [contactName rangeOfString:searchT options:searchOptions range:productNameRange];
    if (foundRange.length > 0)
        return YES;
    else
        return NO;
}

// 搜索
-(void)searchTextWith :(NSString *)searchText {
    
    NSMutableArray *array = [NSMutableArray array];
    [self.nameDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray * temp = (NSArray *)obj;
        for (NSDictionary *dict in temp) {
            NSString * pinyin = [self nameToPinYinWith:dict[@"name"]];
            if ([self searchResult:pinyin  searchText:searchText])
            {
                [array addObject:dict];
                
            }else{
                /*获取当前语言环境*/
                NSString * pinyins = [self namToPinYinFisrtNameWith:dict[@"name"]];
                if([self searchResult:pinyins  searchText:searchText]){
                    [array addObject:dict];
                    
                }else{
                    if ([self searchResult:dict[@"name"] searchText:searchText]) {
                        [array addObject:dict];
                    }
                }
            }
        }
    }];
    
    [self addDataWithSouces:array dicc:self.filterDictionary];
    
}

- (NSArray *)indexTitles
{
    NSMutableArray *defaultKeys = [NSMutableArray arrayWithArray:isSearch ? FILTEREDKEYS : DEFAULTKEYS];
    [defaultKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key = (NSString *)obj;
        if ([key hasPrefix:kCountryInformationHotPrefix]) {
            [defaultKeys replaceObjectAtIndex:idx withObject:@"#"];
            *stop = YES;
        }
    }];
    return [defaultKeys copy];
}

#pragma mark--搜索框
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!searchText.length) {
        [self resetSearchState];
        return;
    }
    
    self.searchBar.showsCancelButton = YES;
    isSearch = YES;
    [self searchTextWith:searchText];
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    return  YES;
    
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    
    return YES;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self resetSearchState];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 表视图相关


#pragma mark--表示图相关方法
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40.f;
};

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = UIView.new;
    headerView.backgroundColor = [UIColor hx_colorWithHexString:@"#F5F6F8"];
    CGRect frame = headerView.frame;
    frame.size = (CGSize){kScreenWidth, 40.f};
    headerView.frame = frame;
    
    UILabel *titleLabel = UILabel.new;
    titleLabel.textColor = [UIColor hx_colorWithHexString:@"#515151"];
    titleLabel.font = [UIFont systemFontOfSize:18.f];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headerView).mas_offset(20.f);
        make.right.mas_equalTo(headerView).mas_offset(-20.f);
        make.centerY.mas_equalTo(headerView);
        make.height.mas_equalTo(headerView);
    }];
    
    NSArray *keys = self.indexTitles;//!isSearch ? DEFAULTKEYS : FILTEREDKEYS;
    NSString *string = keys[section];
    if ([string isEqualToString:@"#"]) {
        string = @"热门地区";
    }
    titleLabel.text = string;
    
    return headerView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{

    //NSArray * keys = !isSearch?DEFAULTKEYS:FILTEREDKEYS;
    NSArray * keys = self.indexTitles;
    return keys.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //NSArray * keys = !isSearch?DEFAULTKEYS:FILTEREDKEYS;
    NSArray * keys = self.indexTitles;
    
    return keys ;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * keys = !isSearch?DEFAULTKEYS:FILTEREDKEYS;
    NSMutableDictionary * dictionary =!isSearch?self.nameDictionary:self.filterDictionary;
    NSArray * array = [dictionary objectForKey:[keys objectAtIndex:section]];
    return [array count];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [ALPHA rangeOfString:title].location;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray * keys = self.indexTitles;
    NSString *string = [keys objectAtIndex:section];
    if ([string isEqualToString:@"#"]) {
        string = @"热门地区";
    }
    return string;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //static NSString *identify=@"countryCell";
    
    CountryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCountryListCellIdentify forIndexPath:indexPath];
    cell.backgroundColor = UIColor.clearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textColor = [UIColor hx_colorWithHexString:@"#515151"];
    
    NSArray * keys = !isSearch?DEFAULTKEYS:FILTEREDKEYS;
    NSMutableDictionary * dictionary = !isSearch?self.nameDictionary:self.filterDictionary;
    NSArray * arrayaa = [dictionary objectForKey:[keys objectAtIndex:indexPath.section]];
    NSDictionary *   dict = [arrayaa objectAtIndex:indexPath.row];
    //cell.country.text=dict[@"name"];
    //cell.phoneCode.text=[NSString stringWithFormat:@"+%@",dict[@"code"]];
    [cell setupWithDict:dict];
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * keys = !isSearch?DEFAULTKEYS:FILTEREDKEYS;
    NSMutableDictionary * dictionary = !isSearch?self.nameDictionary:self.filterDictionary;
    NSArray * arrayaa = [dictionary objectForKey:[keys objectAtIndex:indexPath.section]];
    NSDictionary *   dict = [arrayaa objectAtIndex:indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(countryInforSelected:)]) {
        [self.delegate countryInforSelected:dict];
    }
    
    [self.navigationController popViewControllerAnimated:YES];

    
}

#pragma mark - other
- (UIColor *)textDefaultColor
{
    return [UIColor hx_colorWithHexString:@"#575757"];
}

- (void)resetSearchState
{
    self.searchBar.showsCancelButton = NO;
    isSearch = NO;
    [self.tableView reloadData];
}

#pragma mark - Lazy loads
- (UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_offset(44.f);
            make.left.mas_offset(4.f);
            make.top.mas_offset(self.view.dy_safeEdgeInsets.top);
        }];
        @weakify(self);
        [button bk_addEventHandler:^(id sender) {
            @strongify(self);
            [self.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        
        _backButton = button;
    }
    return _backButton;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = self.textDefaultColor;
        label.font = [UIFont systemFontOfSize:18.f];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(self.view);
            make.height.mas_offset(20.f);
            make.centerY.mas_equalTo(self.backButton);
        }];
        label.text = @"选择国家和地区";
        
        _tipLabel = label;
    }
    return _tipLabel;
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        CGFloat height = 39.f;
        
        UISearchBar *searchBar = [[UISearchBar alloc] init];
        searchBar.backgroundImage = UIImage.new;
        searchBar.backgroundColor = UIColor.clearColor;
        searchBar.barTintColor = UIColor.clearColor;
        searchBar.delegate = self;
        [searchBar setImage:[UIImage imageNamed:@"im_interface_search_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        [searchBar setPlaceholder:@"搜索"];
        
        UITextField *textField = nil;
        for (UIView *view in searchBar.subviews) {
            if ([view isKindOfClass:UITextField.class]) {
                textField = (UITextField *)view;
                break;
            }
            for (UIView *subView in view.subviews) {
                if ([subView isKindOfClass:UITextField.class]) {
                    textField = (UITextField *)subView;
                    break;
                }
                
                for (UIView *subSubView in subView.subviews) {
                    if ([subSubView isKindOfClass:UITextField.class]) {
                        textField = (UITextField *)subSubView;
                        break;
                    }
                }
                if (textField) break;
            }
            if (textField) break;
        }
        
        textField.layer.cornerRadius = height * 0.5f;
        textField.layer.masksToBounds = YES;
        textField.backgroundColor = [UIColor hx_colorWithHexString:@"#FAFAFA"];
        
        [self.view addSubview:searchBar];
        [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).mas_offset(12.f);
            make.right.mas_equalTo(self.view).mas_offset(-12.f);
            make.height.mas_offset(height);
            make.top.mas_equalTo(self.view).mas_offset(NAVIGATION_BAR_HEIGHT + 8);
        }];
        
//        UIView *bottomLineView = [UIView new];
//        bottomLineView.backgroundColor = self.textDefaultColor;
//        [self.view addSubview:bottomLineView];
//        [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(searchBar).mas_offset(8.f);
//            make.right.mas_equalTo(searchBar).mas_offset(-8.f);
//            make.height.mas_offset(0.5f);
//            make.top.mas_equalTo(searchBar.mas_bottom);
//        }];
        
        _searchBar = searchBar;
    }
    return _searchBar;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] init];
        [tableView registerClass:CountryTableViewCell.class
          forCellReuseIdentifier:kCountryListCellIdentify];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = UIColor.clearColor;
        tableView.sectionIndexColor = [UIColor hx_colorWithHexString:@"#999999"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.searchBar.mas_bottom).mas_offset(8.f);
        }];

        _tableView = tableView;
    }
    return _tableView;
}

@end
