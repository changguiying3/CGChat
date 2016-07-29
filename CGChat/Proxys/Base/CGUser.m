//
//  CGUser.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/24.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGUser.h"
#import "NSString+PinYin.h"

@implementation CGUser

-(instancetype)init{
    if (self = [super init]) {
        [CGUser mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"detailInfo" : @"CGUserDetail"};
        }];
    }
    return self;
}

-(void)setUsername:(NSString *)username{
    if ([username isEqualToString:_username]) {
        return;
    }
    _username = username;
    if (self.remarkName.length == 0 && self.nikeName.length == 0 && self.username.length > 0) {
        self.pinyin = username.pinyin;
        self.pinyinInitial = username.pinyinInitial;
    }
}

-(void)setNikeName:(NSString *)nikeName{
    if ([nikeName isEqualToString:_nikeName]) {
        return;
    }
    _nikeName = nikeName;
    if (self.remarkName.length == 0 && self.nikeName.length > 0) {
        self.pinyin = nikeName.pinyin;
        self.pinyinInitial = nikeName.pinyinInitial;
    }
}

-(void)setRemarkName:(NSString *)remarkName{
    if ([remarkName isEqualToString:_remarkName]) {
        return;
    }
    _remarkName = remarkName;
    if (_remarkName.length > 0) {
        self.pinyin = remarkName.pinyin;
        self.pinyinInitial = remarkName.pinyinInitial;
    }
}

#pragma mark - Getter
-(NSString *)showName{
    return self.remarkName.length > 0 ? self.remarkName :(self.nikeName.length > 0 ? self.nikeName : self.username);
}

-(CGUserDetail *)detailInfo{
    if (_detailInfo == nil) {
        _detailInfo = [[CGUserDetail alloc]init];
    }
    return _detailInfo;
}
@end
