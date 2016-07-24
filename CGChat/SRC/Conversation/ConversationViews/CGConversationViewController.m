//
//  CGConversation.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGConversationViewController.h"
#import "CGAddMenuView.h"
#import "CGSearchController.h"

@interface CGConversationViewController ()

@property (nonatomic,strong) UIImageView *scrollTopView;

@property (nonatomic,strong) CGAddMenuView *addMenuView;

@property (nonatomic,strong) CGSearchController *searchController;

@end
@implementation CGConversationViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"微信"];
    [self m_initUI];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.addMenuView.isShow) {
        [self.addMenuView dismiss];
    }
}
#pragma mark - Event Response
-(void) rightBarButtonDown:(UIBarButtonItem *)sender{
    if (self.addMenuView.isShow) {
        [self.addMenuView dismiss];
    }else{
        [self.addMenuView showInView:self.navigationController.view];
    }
}
#pragma mark - Private Mehods-
-(void) m_initUI{
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView addSubview:self.scrollTopView];
    [self.scrollTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableView);
        make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
    }];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

#pragma mark - Getter
-(CGAddMenuView *)addMenuView{
    if (_addMenuView == nil) {
        _addMenuView = [[CGAddMenuView alloc]init];
        //设置代理
    }
    return _addMenuView;
}

-(CGFriendsSearchViewController *)searchVC{
    if (_searchVC == nil) {
        _searchVC = [[CGFriendsSearchViewController alloc]init];
    }
    return _searchVC;
}

-(CGSearchController *)searchController{
    if (_searchController == nil) {
        _searchController = [[CGSearchController alloc]initWithSearchResultsController:_searchVC];
       
//        [_searchController setSearchResultsUpdater:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
//        [_searchController.searchBar setDelegate:self];
        [_searchController setShowVoiceButton:YES];
    }
    return _searchController;
}

-(UIImageView *)scrollTopView{
    if (_scrollTopView == nil) {
        _scrollTopView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"conv_wechat_icon"]];
    }
    return _scrollTopView;
}
@end
