//
//  CGMenuViewController.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/15.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGMenuCell.h"

@interface CGMenuViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) NSString *analyzeTitle;

@end
