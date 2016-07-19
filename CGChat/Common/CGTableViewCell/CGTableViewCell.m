//
//  CGTableViewCell.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGTableViewCell.h"

@implementation CGTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _leftSeparatorSpace = 15.0f;
        _topLineStyle = CGCellLineStyleNone;
        _bottomLineStyle = CGCellLineStyleDefault;
    }
    return self;
}
-(void)setTopLineStyle:(CGCellLineStyle)topLineStyle{
    _topLineStyle = topLineStyle;
    [self setNeedsDisplay];
}
-(void)setBottomLineStyle:(CGCellLineStyle)bottomLineStyle{
    _bottomLineStyle = bottomLineStyle;
    [self setNeedsDisplay];
}
-(void)setLeftSeparatorSpace:(CGFloat)leftSeparatorSpace{
    _leftSeparatorSpace = leftSeparatorSpace;
    [self setNeedsDisplay];
}
-(void)setRightSeparatorSpace:(CGFloat)rightSeparatorSpace{
    _rightSeparatorSpace = rightSeparatorSpace;
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context,BORDER_WIDTH_1PX *2);
    CGContextSetStrokeColorWithColor(context, [UIColor colorGrayLine].CGColor);
    if (self.topLineStyle != CGCellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.topLineStyle == CGCellLineStyleFill ? 0 : _leftSeparatorSpace);
        CGFloat endx = self.width - self.rightSeparatorSpace;
        CGFloat y =0;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endx, y);
        CGContextStrokePath(context);
    }
    if (self.bottomLineStyle != CGCellLineStyleNone) {
        CGContextBeginPath(context);
        CGFloat startX = (self.bottomLineStyle == CGCellLineStyleFill ? 0 : _rightSeparatorSpace);
        CGFloat endx = self.width - self.rightSeparatorSpace;
        CGFloat y = self.height;
        CGContextMoveToPoint(context, startX, y);
        CGContextAddLineToPoint(context, endx, y);
        CGContextStrokePath(context);
    }
}
@end
