//
//  CGUIUtility.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGUIUtility : NSObject

+(CGFloat)getTextHeightOfText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

+(void)captureScreenshotFromView:(UIView *)view rect:(CGRect)rect finished:(void (^)(NSString *avatarPath))finished;
@end
