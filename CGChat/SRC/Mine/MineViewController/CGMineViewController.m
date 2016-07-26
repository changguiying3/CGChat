//
//  CGMineViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineViewController.h"
#import "CGMineHelper.h"
#import "CGMineHeaderCell.h"

#import "CGMineInfoViewController.h"

@interface CGMineViewController  ()

@property (nonatomic,strong) CGMineHelper *mineHelper;

@end
@implementation CGMineViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我"];
    
    self.mineHelper = [[CGMineHelper alloc]init];
    self.data = self.mineHelper.mineMenuData;
    
    [self.tableView registerClass:[CGMineHeaderCell class] forCellReuseIdentifier:@"CGMineHeaderCell"];
    
    
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGMineHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGMineHeaderCell"];
        [cell setUser:[CGUserHelper sharedHelper].user];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}

//MARK: UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGMineInfoViewController *mineInfoVC = [[CGMineInfoViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:mineInfoVC animated:YES];
        //不加这句返回时，tabbar消失
        [self setHidesBottomBarWhenPushed:NO];
        [super tableView:tableView didSelectRowAtIndexPath:indexPath];
        return;
    }
}
@end
