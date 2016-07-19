//
//  CGNavigationController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGNavigationController.h"

@implementation CGNavigationController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.navigationBar setBarTintColor:[UIColor colorBlackForNavBar]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontNavBarTitle]}];
}
@end
