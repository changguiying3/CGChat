//
//  CGAddMenuView.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGAddMenuView : UIView
/**
 *  显示AddMenu
 *
 *  @param view 父View
 */
-(void)showInView:(UIView *)view;
/**
 *  是否正在显示
 */
-(BOOL)isShow;
/**
 *   隐藏
 */
-(void)dismiss;

@end
