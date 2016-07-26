//
//  CGSettingViewController.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGSettingCell.h"
#import "CGSettingSwitchCell.h"
#import "CGSettingGroup.h"

#define      HEIGHT_SETTING_CELL          44.0f
#define      HEIGHT_SETTING_TOP_SPACE     15.0f
#define      HEIGHT_SETTING_BOTTOM_SPACE  12.0f

@interface CGSettingViewController : UITableViewController <CGSettingSwitchCellDelegate>

@property (nonatomic,strong) NSMutableArray *data;

@property (nonatomic,strong) NSString *analyzeTitle;

@end
