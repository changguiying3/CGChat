//
//  CGMenuViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMenuViewController.h"
#import <MobClick.h>


@implementation CGMenuViewController

//在loadView中设置tableView的属性和尺寸
-(void)loadView{
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN,HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, 20)]];
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self.tableView registerClass:[CGMenuCell class] forCellReuseIdentifier:@"CGMenuCell"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:self.analyzeTitle];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}

-(void)dealloc{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}

#pragma mark -
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGMenuCell"];
    CGMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    [cell setMenuItem:item];
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGMenuItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    
    if (item.rightIconURL != nil || item.subTitle != nil) {
        item.rightIconURL = nil;
        item.subTitle = nil;
        item.showRightRedPiont = NO;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        //返回时慢慢变为非选中状态
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15.0f;
}
//第一个和第二个section之间的间距 这个的间距加上 heightForHeader的间距
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5.0f;
}

#pragma mark - Getter -
#pragma mark - Getter -
-(NSString *)analyzeTitle{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }else{
        return _analyzeTitle;
    }
}
@end
