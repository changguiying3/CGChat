//
//  CGUser.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/24.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGBaseDataModel.h"
#import "CGUserDetail.h"

@interface CGUser : CGBaseDataModel

/// 用户ID
@property (nonatomic, copy) NSString *userID;

/// 用户名
@property (nonatomic, copy) NSString *username;

/// 昵称
@property (nonatomic, copy) NSString *nikeName;

/// 头像URL
@property (nonatomic, copy) NSString *avatarURL;

/// 头像Path
@property (nonatomic, copy) NSString *avatarPath;

/// 备注名
@property (nonatomic, copy) NSString *remarkName;

/// 界面显示名称
@property (nonatomic, copy, readonly) NSString *showName;

#pragma mark - 其他
@property (nonatomic,strong) CGUserDetail *detailInfo;

#pragma mark - 列表用
/**
 *  拼音
 *
 *  来源：备注 > 昵称 > 用户名
 */
@property (nonatomic,copy) NSString *pinyin;

@property (nonatomic,copy) NSString *pinyinInitial;

@end
