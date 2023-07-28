//
//  VTDLabel.h
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VTDLabel : UILabel

@property (nonatomic, copy) void(^textDidClicked)(NSInteger textIndex);

@end

NS_ASSUME_NONNULL_END
