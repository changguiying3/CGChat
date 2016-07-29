//
//  CGUserDetail.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/27.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGUserDetail : NSObject

@property (nonatomic, copy) NSString *userID;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *phoneNumber;

@property (nonatomic, copy) NSString *qqNumber;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSArray *albumArray;

@property (nonatomic, copy) NSString *motto;

@property (nonatomic, copy) NSString *momentsWallURL;


/// 备注信息
@property (nonatomic, copy) NSString *remarkInfo;

/// 备注图片（本地地址）
@property (nonatomic, copy) NSString *remarkImagePath;

/// 备注图片 (URL)
@property (nonatomic, copy) NSString *remarkImageURL;

/// 标签
@property (nonatomic, strong) NSMutableArray *tags;

@end
