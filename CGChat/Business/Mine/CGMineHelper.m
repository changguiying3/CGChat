//
//  CGMineHelper.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/23.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineHelper.h"
#import "CGMenuItem.h"

@implementation CGMineHelper

-(instancetype)init{
    if (self = [super init]) {
        self.mineMenuData = [[NSMutableArray alloc]init];
        
        [self m_initTestData];
    }
    return self;
}

-(void) m_initTestData{
    CGMenuItem *item0 = CGCreateMenuItem(nil, nil);
    CGMenuItem *item1 = CGCreateMenuItem(@"mine_album", @"相册");
    CGMenuItem *item2 = CGCreateMenuItem(@"mine_favorites", @"收藏");
    CGMenuItem *item3 = CGCreateMenuItem(@"mine_wallet", @"钱包");
    CGMenuItem *item4 = CGCreateMenuItem(@"mine_card", @"优惠券");
    CGMenuItem *item5 = CGCreateMenuItem(@"mine_expression", @"表情");
    CGMenuItem *item6 = CGCreateMenuItem(@"mine_setting", @"设置");
    [self.mineMenuData addObjectsFromArray:@[@[item0],@[item1,item2,item3,item4],@[item5],@[item6]]];
    
}
@end
