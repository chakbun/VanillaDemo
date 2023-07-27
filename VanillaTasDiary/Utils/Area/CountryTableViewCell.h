//
//  CountryTableViewCell.h
//  GDLiveStreaming
//
//  Created by 
//  Copyright © 2016年 Larry Tin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *country;

@property (nonatomic, weak) IBOutlet UILabel *phoneCode;//电话区号

@property (nonatomic, strong) UIColor *textColor;

- (void)setupWithDict:(NSDictionary *)dict;


@end
