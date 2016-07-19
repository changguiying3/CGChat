//
//  UIColor+CGChat.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CGChat)
#pragma mark - # 字体
+ (UIColor *) colorTextBlack;
+ (UIColor *) colorTextGray;
+ (UIColor *) colorTextGray1;

#pragma mark - 灰色
+ (UIColor *)colorGrayBG;           // 浅灰色默认背景
+ (UIColor *)colorGrayCharcoalBG;   // 较深灰色背景（聊天窗口, 朋友圈用）
+ (UIColor *)colorGrayLine;
+ (UIColor *)colorGrayForChatBar;
+ (UIColor *)colorGrayForMoment;

#pragma mark - 绿色
+ (UIColor *)colorGreenDefault;

#pragma mark - 蓝色
+ (UIColor *)colorBlueMoment;


#pragma mark - 黑色
+ (UIColor *)colorBlackForNavBar;
+ (UIColor *)colorBlackBG;
+ (UIColor *)colorBlackAlphaScannerBG;
+ (UIColor *)colorBlackForAddMenu;
+ (UIColor *)colorBlackForAddMenuHL;

@end
