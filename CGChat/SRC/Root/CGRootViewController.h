//
//  CGRootViewController.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGTabBarController.h"

@interface CGRootViewController : CGTabBarController
+ (CGRootViewController *) sharedRootViewController;
/**
 *  获取tabbarController的第Index个vc(不是navController)
 */
-(id)childViewControllerAtIndex:(NSUInteger)index;
@end
