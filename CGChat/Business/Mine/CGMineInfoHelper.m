//
//  CGMineInfoHelper.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/26.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineInfoHelper.h"

@interface CGMineInfoHelper ()

@property (nonatomic,strong) NSMutableArray *mineInfoData;

@end
@implementation CGMineInfoHelper

-(instancetype)init{
    if (self = [super init]) {
        _mineInfoData = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray *)mineInfoDataByUserInfo:(CGUser *)userInfo{
    CGSettingItem *avatar = CGCreateSettingItem(@"头像");
    avatar.rightImageURL = userInfo.avatarURL;
    CGSettingItem *nikename = CGCreateSettingItem(@"名字");
    nikename.subTitle = userInfo.nikeName.length > 0 ? userInfo.nikeName : @"未设置";
    CGSettingItem *username = CGCreateSettingItem(@"微信号");
    if (userInfo.username.length > 0) {
        username.subTitle = userInfo.username;
        username.showDisclosureIndicator = NO;
        username.disableHighlight = YES;
    }else{
        username.subTitle = @"未设置";
    }
    CGSettingItem *qrCode = CGCreateSettingItem(@"我的二维码");
    qrCode.rightImagePath = @"mine_cell_myQR";
    CGSettingItem *location = CGCreateSettingItem(@"我的地址");
    CGSettingGroup *group1 = CGCreateSettingGroup(nil, nil, (@[avatar,nikename,username,qrCode,location]));
    
    CGSettingItem *sex = CGCreateSettingItem(@"性别");///
    CGSettingItem *city = CGCreateSettingItem(@"地区");
    CGSettingItem *motto = CGCreateSettingItem(@"个性签名");
    CGSettingGroup *group2 = CGCreateSettingGroup(nil, nil, (@[sex,city,motto]));
    
    [_mineInfoData removeAllObjects];
    [_mineInfoData addObjectsFromArray:@[group1,group2]];
    return _mineInfoData;
    
}
@end
