//
//  CGMineViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineViewController.h"
#import "CGMineHelper.h"

@interface CGMineViewController  ()

@property (nonatomic,strong) CGMineHelper *mineHelper;

@end
@implementation CGMineViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我"];
    
    self.mineHelper = [[CGMineHelper alloc]init];
    self.data = self.mineHelper.mineMenuData;
    
    
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [super tableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}

//MARK: UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }
    return [super tableView:tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
}
@end
