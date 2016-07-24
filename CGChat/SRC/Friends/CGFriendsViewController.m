//
//  CGFriendsViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGFriendsViewController.h"
#import "CGSearchController.h"

@interface CGFriendsViewController ()

@property (nonatomic,strong) CGSearchController *searchController;

@end

@implementation CGFriendsViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"通讯录"];
    [self m_initUI];//初始化界面
}
#pragma mark - Event Response -
-(void)rightBarButtonDown:(UIBarButtonItem *)sender{
    NSLog(@"搜索好友");
}
#pragma mark - Private Method -
-(void)m_initUI{
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add_friend"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

#pragma mark -Getter -
-(CGSearchController *)searchController{
    if (_searchController == nil) {
        _searchController = [[CGSearchController alloc]initWithSearchResultsController:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController setShowVoiceButton:YES];
    }
    return _searchController;
}
-(CGFriendsSearchViewController *)searchVC{
    if (_searchVC == nil) {
        _searchVC = [[CGFriendsSearchViewController alloc]init];
    }
    return _searchVC;
}
@end
