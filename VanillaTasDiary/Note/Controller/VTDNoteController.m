//
//  VTDNoteController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDNoteController.h"

@interface VTDNoteController ()

@end

@implementation VTDNoteController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"写日记";
    
    UIButton *writeNoteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    writeNoteButton.frame = CGRectMake(0, 0, 44, 44);
    [writeNoteButton setBackgroundColor:UIColor.redColor];
    [writeNoteButton addTarget:self action:@selector(didWriteNoteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:writeNoteButton];
}

- (void)didWriteNoteButtonClicked:(UIButton *)button {
    
}

@end
