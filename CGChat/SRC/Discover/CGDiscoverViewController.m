//
//  CGDiscoverViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGDiscoverViewController.h"
#import "CGDiscoverHelper.h"

@interface CGDiscoverViewController ()

@property (nonatomic, strong) CGDiscoverHelper *discoverHelper;

@end

@implementation CGDiscoverViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"发现"];
    
    self.discoverHelper = [[CGDiscoverHelper alloc]init];
    self.data = self.discoverHelper.discoverMenuData;
}
@end
