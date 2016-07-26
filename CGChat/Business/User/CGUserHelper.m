//
//  CGUserHelper.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/24.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGUserHelper.h"

static CGUserHelper *helper;

@implementation CGUserHelper

+(CGUserHelper *)sharedHelper{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        helper = [[CGUserHelper alloc]init];
    });
    return helper;
}

-(NSString *)userID{
    return self.user.userID;
}

-(instancetype)init{
    if (self = [super init]) {
        self.user = [[CGUser alloc]init];
        self.user.userID = @"1000";
        self.user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
        self.user.nikeName = @"常桂盈";
        self.user.username = @"chang-guiying";
    }
    return self;
}
@end
