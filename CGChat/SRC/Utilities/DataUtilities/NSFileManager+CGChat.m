//
//  NSFileManager+CGChat.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/28.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "NSFileManager+CGChat.h"

@implementation NSFileManager (CGChat)

+(NSString *)pathScreenshotImage:(NSString *)imageName{
    NSString *path = [NSString stringWithFormat:@"%@/Screenshot/",[NSFileManager documentsPath]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

@end
