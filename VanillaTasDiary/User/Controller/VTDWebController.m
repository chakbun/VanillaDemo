//
//  VTDWebController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDWebController.h"
#import <WebKit/WebKit.h>
#import "Masonry.h"

@interface VTDWebController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *pageView;

@end

@implementation VTDWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageView = [[WKWebView alloc] init];
    [self.view addSubview:self.pageView];
    [self.pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.pageView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

