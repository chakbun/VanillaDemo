//
//  CountryTableViewCell.m
//  GDLiveStreaming
//
//  Created by 
//  Copyright © 2016年 Larry Tin. All rights reserved.
//

#import "CountryTableViewCell.h"
#import "Masonry.h"

@implementation CountryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupWithDict:(NSDictionary *)dict
{
    self.country.text = dict[@"name"];
    self.phoneCode.text = [NSString stringWithFormat:@"+%@", dict[@"code"]];
}

#pragma mark - Lazy loads
- (UILabel *)country
{
    if (!_country) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = _textColor ?: UIColor.blackColor;
        label.font = [UIFont systemFontOfSize:15.f];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.mas_offset(8.f);
            make.left.mas_offset(20.f);
            make.right.mas_equalTo(self.contentView.mas_centerX);
            make.height.mas_equalTo(self.contentView);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        _country = label;
    }
    return _country;
}

- (UILabel *)phoneCode
{
    if (!_phoneCode) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = _textColor ?: UIColor.blackColor;
        label.font = [UIFont systemFontOfSize:15.f];
        label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-8.f);
            make.left.mas_equalTo(self.contentView.mas_centerX);
            make.height.mas_equalTo(self.contentView);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        _phoneCode = label;
    }
    return _phoneCode;
}

@end
