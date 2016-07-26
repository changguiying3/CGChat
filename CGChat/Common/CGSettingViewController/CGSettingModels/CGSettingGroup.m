//
//  CGSettingGroup.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingGroup.h"

@implementation CGSettingGroup

+(CGSettingGroup *)createGroupWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle items:(NSMutableArray *)items{
    CGSettingGroup *group = [[CGSettingGroup alloc]init];
    group.headerTitle = headerTitle;
    group.footerTitle = footerTitle;
    group.items = items;
    return group;
}

#pragma mark - Public Method
-(instancetype)objectAtIndex:(NSUInteger)index{
    return [self.items objectAtIndex:index];
}

-(NSInteger)indexOfObject:(id)obj{
    return [self.items indexOfObject:obj];
}

-(void)removeObject:(id)obj{
    return[self.items removeObject:obj];
}

#pragma  mark - Setter
-(void)setHeaderTitle:(NSString *)headerTitle{
    _headerTitle = headerTitle;
    _headerHeight = [CGUIUtility getTextHeightOfText:headerTitle font:[UIFont fontSettingHeaderAndFooterTitle] width:WIDTH_SCREEN - 30];
}

-(void)setFooterTitle:(NSString *)footerTitle{
    _footerTitle = footerTitle;
    _footerHeight = [CGUIUtility getTextHeightOfText:footerTitle font:[UIFont fontSettingHeaderAndFooterTitle] width:WIDTH_SCREEN - 30];
}
#pragma mark - Getter
-(NSUInteger)count{
    return self.items.count;
}
@end
