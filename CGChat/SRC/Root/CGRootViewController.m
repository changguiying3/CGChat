//
//  CGRootViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGRootViewController.h"
#import "CGConversationViewController.h"
#import "CGFriendsViewController.h"
#import "CGDiscoverViewController.h"
#import "CGMineViewController.h"
static CGRootViewController *rootVc = nil;
@interface CGRootViewController ()

@property (nonatomic,strong) NSArray *childVCArray;

@property (nonatomic,strong) CGConversationViewController *conversationVC;
@property (nonatomic,strong) CGFriendsViewController *friendsVC;
@property (nonatomic,strong) CGDiscoverViewController *discoverVC;
@property (nonatomic,strong) CGMineViewController *mineVC;
@end

@implementation CGRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewControllers:self.childVCArray];//初始化子控件
}
+(CGRootViewController *)sharedRootViewController{
    static dispatch_once_t onece;
    dispatch_once(&onece, ^{
        rootVc = [[CGRootViewController alloc]init];
    });
    return rootVc;
}
-(id)childViewControllerAtIndex:(NSUInteger)index{
    return [[self.childViewControllers objectAtIndex:index]rootViewController];
}
#pragma mark - Getters
-(NSArray *)childVCArray{
    if (_childVCArray == nil) {
        CGNavigationController *convNaC = [[CGNavigationController alloc]initWithRootViewController:self.conversationVC];
        CGNavigationController *friendNavC = [[CGNavigationController alloc]initWithRootViewController:self.friendsVC];
        CGNavigationController *discoverNavC = [[CGNavigationController alloc]initWithRootViewController:self.discoverVC];
        CGNavigationController *mineNavC = [[CGNavigationController alloc]initWithRootViewController:self.mineVC];
        _childVCArray = @[convNaC,friendNavC,discoverNavC,mineNavC];
    }
    return _childVCArray;
}
-(CGConversationViewController *)conversationVC{
    if (_conversationVC == nil) {
        _conversationVC = [[CGConversationViewController alloc]init];
        [self addChildVC:_conversationVC setTabBarTitle:@"消息" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    }
    return _conversationVC;
}

-(CGFriendsViewController *)friendsVC{
    if (_friendsVC == nil) {
        _friendsVC = [[CGFriendsViewController alloc]init];
        [self addChildVC:_friendsVC setTabBarTitle:@"通讯录" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
    }
    return _friendsVC;
}
-(CGDiscoverViewController *)discoverVC{
    if (_discoverVC == nil) {
        _discoverVC = [[CGDiscoverViewController alloc]init];
        [self addChildVC:_discoverVC setTabBarTitle:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
    }
    return _discoverVC;
}
-(CGMineViewController *)mineVC{
    
    if (_mineVC == nil) {
        _mineVC = [[CGMineViewController alloc]init];
        [self addChildVC:_mineVC setTabBarTitle:@"我" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];
    }
    return _mineVC;
}
-(void)addChildVC:(UIViewController *)childVC setTabBarTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    [childVC.tabBarItem setTitle:title];
    [childVC.tabBarItem setImage:[UIImage imageNamed:image]];
    [childVC.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
}
@end
