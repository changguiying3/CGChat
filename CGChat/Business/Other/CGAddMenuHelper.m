//
//  CGAddMenuHelper.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGAddMenuHelper.h"

@interface CGAddMenuHelper ()

@property (nonatomic,strong) NSArray *menuItemTypes;

@end
@implementation CGAddMenuHelper

-(instancetype)init{
    if (self = [super init]) {
        _menuItemTypes = @[@"0",@"1",@"2",@"3"];
    }
    return self;
}
-(NSMutableArray *)menuData{
    if (_menuData == nil) {
        _menuData = [[NSMutableArray alloc]init];
        for (NSString *type in self.menuItemTypes) {
            CGAddMenuItem *item = [self p_getMenuItemByType:[type integerValue]];//将字符串的类型转换成整型数据
            [_menuData addObject:item];
        }
    }
    return _menuData;
}
-(CGAddMenuItem *)p_getMenuItemByType:(CGAddMenuType)type{
    switch (type) {
        case CGAddMenuTypeGroupChat:    //群聊
            return [CGAddMenuItem createWithType:CGAddMenuTypeGroupChat title:@"发起群聊" iconPath:@"nav_menu_groupchat" className:@""];
            break;
        case CGAddMenuTypeAddFriend:        // 添加好友
            return [CGAddMenuItem createWithType:CGAddMenuTypeAddFriend title:@"添加朋友" iconPath:@"nav_menu_addfriend" className:@"TLAddFriendViewController"];
            break;
        case CGAddMenuTypeWallet:           // 收付款
            return [CGAddMenuItem createWithType:CGAddMenuTypeWallet title:@"收付款" iconPath:@"nav_menu_wallet" className:@""];
            break;
        case CGAddMenuTypeScan:             // 扫一扫
            return [CGAddMenuItem createWithType:CGAddMenuTypeScan title:@"扫一扫" iconPath:@"nav_menu_scan" className:@"TLScanningViewController"];
            break;
        default:
            break;
    }
}
@end
