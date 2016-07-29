//
//  CGViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/27.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGViewController.h"
#import <MobClick.h>

@implementation CGViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:self.analyzeTitle];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}

-(void)dealloc{
#ifdef DEBUG_MEMERY
    NSLog(@"%@",self.navigationItem.title);
#endif
}
#pragma mark - Getter
-(NSString *)analyzeTitle{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}
@end
