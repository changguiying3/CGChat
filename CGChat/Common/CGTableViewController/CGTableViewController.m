//
//  CGTableViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/19.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGTableViewController.h"
#import <MobClick.h>

@implementation CGTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setTableHeaderView:[UIView new]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:self.analyzeTitle];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [MobClick beginLogPageView:self.analyzeTitle];
}

-(void)dealloc{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}
#pragma mark - Getter -
-(NSString *)analyzeTitle{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}
@end
