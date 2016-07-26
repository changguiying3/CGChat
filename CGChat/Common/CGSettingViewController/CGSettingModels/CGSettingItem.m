//
//  CGSettingItem.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingItem.h"

@implementation CGSettingItem

+(CGSettingItem *)createItemWithTitle:(NSString *)title{
    CGSettingItem *item = [[CGSettingItem alloc]init];
    item.title = title;
    return item;
}

-(instancetype)init{
    if (self = [super init]) {
        self.showDisclosureIndicator = YES;
    }
    return self;
}

-(NSString *)cellClassName{
    switch (self.type) {
        case CGSettingItemTypeDefalut:
            return @"CGSettingCell";
            break;
        case CGSettingItemTypeTitleButton:
            return @"CGSettingButtonCell";
            break;
        case CGSettingItemTypeSwitch:
            return @"CGSettingSwitchCell";
        default:
            break;
    }
    return nil;
}
@end
