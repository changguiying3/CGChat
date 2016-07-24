//
//  CGMenuItem.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/21.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMenuItem.h"

@implementation CGMenuItem

+(CGMenuItem *)createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title{
    CGMenuItem *item = [[CGMenuItem alloc]init];
    item.iconPath = iconPath;
    item.title = title;
    return item;
}

@end
