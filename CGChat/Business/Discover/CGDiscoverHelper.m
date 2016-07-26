//
//  CGDiscoverHelper.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/24.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGDiscoverHelper.h"
#import "CGMenuItem.h"

@implementation CGDiscoverHelper

-(instancetype)init{
    if (self = [super init]) {
        self.discoverMenuData = [[NSMutableArray alloc]init];
        [self p_initTestData];
    }
    return self;
}

-(void) p_initTestData{
    CGMenuItem *item1 = CGCreateMenuItem(@"discover_album", @"朋友圈");
    item1.rightIconURL = @"http://img4.duitang.com/uploads/item/201510/16/20151016113134_TZye4.thumb.224_0.jpeg";
    item1.showRightRedPiont = YES;
    CGMenuItem *item2 = CGCreateMenuItem(@"discover_QRcode", @"扫一扫");
    CGMenuItem *item3 = CGCreateMenuItem(@"discover_shake", @"摇一摇");
    CGMenuItem *item4 = CGCreateMenuItem(@"discover_location", @"附近的人");
    CGMenuItem *item5 = CGCreateMenuItem(@"discover_bottle", @"漂流瓶");
    CGMenuItem *item6 = CGCreateMenuItem(@"discover_shopping", @"购物");
    CGMenuItem *item7 = CGCreateMenuItem(@"discover_game", @"游戏");
    item7.rightIconURL = @"http://qq1234.org/uploads/allimg/140404/3_140404151205_8.jpg";
    item7.subTitle = @"英雄联盟计算器版";
    item7.showRightRedPiont = YES;
    [self.discoverMenuData addObjectsFromArray:@[@[item1],@[item2,item3],@[item4,item5],@[item6,item7]]];
    
}

@end
