//
//  CGMineInfoViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/26.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineInfoViewController.h"
#import "CGMineInfoHelper.h"
#import "CGMineInfoAvatarCell.h"

@interface CGMineInfoViewController  ()

@property (nonatomic,strong) CGMineInfoHelper *helper;

@end
@implementation CGMineInfoViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    
    [self.tableView registerClass:[CGMineInfoAvatarCell class] forCellReuseIdentifier:@"CGMineInfoAvatarCell"];
    
    self.helper = [[CGMineInfoHelper alloc]init];
    self.data = [self.helper mineInfoDataByUserInfo:[CGUserHelper sharedHelper].user];
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"头像"]) {
        CGMineInfoAvatarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGMineInfoAvatarCell"];
        [cell setItem:item];
        return cell;
    }else{
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

//MARK: UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"头像"]) {
        return 85.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}
@end
