//
//  CGConversation.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGConversationViewController.h"
#import "CGAddMenuView.h"

@interface CGConversationViewController ()

@property (nonatomic,strong) UIImageView *scrollTopView;

@property (nonatomic,strong) CGAddMenuView *addMenuView;

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
@end
