//
//  CGConversation.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGConversationViewController.h"

@implementation CGConversationViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"微信"];
    [self m_initUI];
    
}
#pragma mark - Event Response
-(void) rightBarButtonDown:(UIBarButtonItem *)sender{
    NSLog(@"显示下拉查找好友");
}
#pragma mark - Private Mehods-
-(void) m_initUI{
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}
@end
