//
//  VTDLabel.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/28.
//

#import "VTDLabel.h"

@interface VTDLabel ()
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;
@property (nonatomic, strong) NSTextStorage *textStorage;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureReg;
@end

@implementation VTDLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.textContainer = [[NSTextContainer alloc] initWithSize:CGSizeZero];
        self.textContainer.lineFragmentPadding = 0.0;
        self.textContainer.lineBreakMode = self.lineBreakMode;
        self.textContainer.maximumNumberOfLines = self.numberOfLines;
        
        self.layoutManager = [[NSLayoutManager alloc] init];
        [self.layoutManager addTextContainer:self.textContainer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textContainer.size = self.bounds.size;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    self.textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedText];
    [self.textStorage addLayoutManager:self.layoutManager];
    super.attributedText = attributedText;
}

- (void)setTextDidClicked:(void (^)(NSInteger))textDidClicked {
    _textDidClicked = textDidClicked;
    
    if(!self.tapGestureReg) {
        self.userInteractionEnabled = YES;
        self.tapGestureReg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self addGestureRecognizer:self.tapGestureReg];
    }
}

- (void)tapGestureAction:(UITapGestureRecognizer *)reg {
    if (self.textDidClicked) {
        CGPoint locationOfTouchInLabel = [reg locationInView:reg.view];
        CGSize labelSize = reg.view.bounds.size;
        CGRect textBoundingBox = [self.layoutManager usedRectForTextContainer:self.textContainer];
        CGPoint textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        CGPoint locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x, locationOfTouchInLabel.y - textContainerOffset.y);
        NSInteger indexOfCharacter = [self.layoutManager characterIndexForPoint:locationOfTouchInTextContainer inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:nil];
        self.textDidClicked(indexOfCharacter);
    }
}

@end
