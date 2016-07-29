//
//  NSFileManager+CGChat.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/28.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSFileManager+Paths.h"

@interface NSFileManager (CGChat)
/**
 *  图片 － 屏幕截图
 */
+ (NSString *)pathScreenshotImage:(NSString *)imageName;

@end
