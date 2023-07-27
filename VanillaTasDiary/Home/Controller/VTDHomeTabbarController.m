//
//  VTDHomeTabbarController.m
//  VanillaTasDiary
//
//  Created by zebin on 2023/7/27.
//

#import "VTDHomeTabbarController.h"
#import "VTDNoteController.h"
#import "VTDCommunityNotesController.h"
#import "VTDNoteListController.h"
#import "VTDProfileController.h"

@interface VTDHomeTabbarController ()

@property (nonatomic, strong) VTDNoteController *noteController;
@property (nonatomic, strong) VTDCommunityNotesController *communityController;
@property (nonatomic, strong) VTDNoteListController *noteListController;
@property (nonatomic, strong) VTDProfileController *profileController;

@end

@implementation VTDHomeTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = UIColor.blackColor;
    self.tabBar.backgroundColor = UIColor.whiteColor;
    
    UITabBarItem *noteTabItem = [[UITabBarItem alloc] initWithTitle:@"日记" image:[[UIImage imageNamed:@"icon_tab_note"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_tab_note_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *listTabItem = [[UITabBarItem alloc] initWithTitle:@"记录" image:[[UIImage imageNamed:@"icon_tab_note_list"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_tab_note_list_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *communityTabItem = [[UITabBarItem alloc] initWithTitle:@"过客" image:[[UIImage imageNamed:@"icon_tab_community"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_tab_community_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarItem *profileTabItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"icon_tab_profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_tab_profile_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    VTDNoteController *noteController = [[VTDNoteController alloc] init];
    UINavigationController *noteNavController = [[UINavigationController alloc] initWithRootViewController:noteController];
    noteNavController.tabBarItem = noteTabItem;
    noteNavController.navigationBar.translucent = NO;
    self.noteController = noteController;
    
    VTDNoteListController *listController = [[VTDNoteListController alloc] init];
    UINavigationController *listNavController = [[UINavigationController alloc] initWithRootViewController:listController];
    listNavController.tabBarItem = listTabItem;
    listNavController.navigationBar.translucent = NO;
    self.noteListController = listController;

    VTDCommunityNotesController *communityController = [[VTDCommunityNotesController alloc] init];
    UINavigationController *communityNavController = [[UINavigationController alloc] initWithRootViewController:communityController];
    communityNavController.tabBarItem = communityTabItem;
    communityNavController.navigationBar.translucent = NO;
    self.communityController = communityController;

    VTDProfileController *profileController = [[VTDProfileController alloc] init];
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileController];
    profileNavController.tabBarItem = profileTabItem;
    profileNavController.navigationBar.translucent = NO;
    self.profileController = profileController;

    self.viewControllers = @[noteNavController, listNavController, communityNavController, profileNavController];
}

@end
