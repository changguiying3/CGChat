//
//  CGUIUtility.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGUIUtility.h"

static UILabel *hLabel = nil;

@implementation CGUIUtility

+(CGFloat)getTextHeightOfText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
    if (hLabel == nil) {
        hLabel = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [hLabel setNumberOfLines:0];
    }
    [hLabel setWidth:width];
    [hLabel setFont:font];
    [hLabel setText:text];
    //根据文字或者图像来返回尺寸大小
    return [hLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)].height;
}
@end
