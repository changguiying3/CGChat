//
//  CGSettingViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingViewController.h"
#import "CGSettingHeaderTitleView.h"
#import "CGSettingFooterTitleView.h"
#import "CGSettingButtonCell.h"
#import <MobClick.h>

@implementation CGSettingViewController

-(void)loadView{
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    [self.tableView setTableHeaderView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SETTING_TOP_SPACE)]];
//    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SETTING_BOTTOM_SPACE)]];
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView registerClass:[CGSettingHeaderTitleView class] forHeaderFooterViewReuseIdentifier:@"CGSettingHeaderTitleView"];
    [self.tableView registerClass:[CGSettingFooterTitleView class] forHeaderFooterViewReuseIdentifier:@"CGSettingFooterTitleView"];
    [self.tableView registerClass:[CGSettingButtonCell class] forCellReuseIdentifier:@"CGSettingButtonCell"];
    [self.tableView registerClass:[CGSettingSwitchCell class] forCellReuseIdentifier:@"CGSettingSwitchCell"];
    [self.tableView registerClass:[CGSettingCell class] forCellReuseIdentifier:@"CGSettingCell"];
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
    NSLog(@"dealloc %@",self.navigationItem.title);
#endif
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    id cell = [tableView dequeueReusableCellWithIdentifier:item.cellClassName];
    [cell setItem:item];
    if (item.type == CGSettingItemTypeSwitch) {
        [cell setDelegate:self];
    }
    return cell;
}
//MARK: UITableViewDelegate
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    CGSettingGroup *group = self.data[section];
//    if (group.headerTitle == nil) {
//        return nil;
//    }
//    CGSettingHeaderTitleView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CGSettingHeaderTitleView"];
//    [view setText:group.headerTitle];
//    return view;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    CGSettingGroup *group = self.data[section];
//    if (group.footerTitle == nil) {
//        return nil;
//    }
//    CGSettingFooterTitleView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CGSettingFooterTitleView"];
//    [view setText:group.footerTitle];
//    return view;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HEIGHT_SETTING_CELL;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    CGSettingGroup *group = self.data[section];
//    return 0.5 + (group.headerTitle == nil ? 0 : 5.0f + group.headerHeight);
//}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    CGSettingGroup *group = self.data[section];
//    return 0.5 + (group.footerTitle == nil ? 0 : 5.0f + group.footerHeight);
//}

//MARK: TLSettingSwitchCellDelegate
-(void)settingSwitchCellForItem:(CGSettingItem *)settingItem didChangeStatus:(BOOL)on{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Switch事件未被子类处理" message:[NSString stringWithFormat:@"Title: %@\nStatus: %@", settingItem.title, (on ? @"on" : @"off")] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//    [alert show];
}

#pragma mark - Getter
-(NSString *)analyzeTitle{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}
@end
