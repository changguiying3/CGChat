//
//  CGUserHelper.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/24.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGUser.h"

@interface CGUserHelper : NSObject

@property (nonatomic,strong) CGUser *user;

@property (nonatomic,strong,readonly) NSString *userID;

+ (CGUserHelper *) sharedHelper;

@end
