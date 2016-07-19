//
//  CGTableViewCell.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CGCellLineStyle) {
    CGCellLineStyleNone,
    CGCellLineStyleDefault,
    CGCellLineStyleFill,
};
@interface CGTableViewCell : UITableViewCell
/** 左边距 **/
@property (nonatomic,assign) CGFloat leftSeparatorSpace;
/** 右边距，默认为0，要修改只能直接指定 **/
@property (nonatomic,assign) CGFloat rightSeparatorSpace;

@property (nonatomic,assign) CGCellLineStyle topLineStyle;
@property (nonatomic,assign) CGCellLineStyle bottomLineStyle;
@end
