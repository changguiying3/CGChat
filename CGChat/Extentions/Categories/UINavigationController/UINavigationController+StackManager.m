//
//  UINavigationController+StackManager.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "UINavigationController+StackManager.h"

@implementation UINavigationController (StackManager)
/**
 *  RootViewController
 *
 *  @return RootViewController
 */
-(UIViewController *)rootViewController{
    if (self.viewControllers && [self.viewControllers count] > 0) {
        return [self.viewControllers firstObject];
    }
    return nil;
}
@end
