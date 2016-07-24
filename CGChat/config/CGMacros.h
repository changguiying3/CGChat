//
//  CGMacros.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#ifndef CGMacros_h
#define CGMacros_h

#pragma mark - SIZE
#define     SIZE_SCREEN                 [UIScreen mainScreen].bounds
#define     HEIGHT_SCREEN               [UIScreen mainScreen].bounds.size.height
#define     WIDTH_SCREEN                [UIScreen mainScreen].bounds.size.width
#define     HEIGHT_STATUSBAR            20.0f
#define     HEIGHT_TABBAR               49.0f
#define     HEIGHT_NAVBAR               44.0f

#define DEFAULT_AVATAR_PATH    @"default_head"
#define     TLColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define     BORDER_WIDTH_1PX            ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)

#pragma mark - Methods
#define  CGURL(urlString)    [NSURL URLWithString:urlString]
#endif /* CGMacros_h */
