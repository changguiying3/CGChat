//
//  CGSettingSwitchCell.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGSettingItem.h"

@protocol CGSettingSwitchCellDelegate <NSObject>
@optional
-(void)settingSwitchCellForItem:(CGSettingItem *)settingItem didChangeStatus:(BOOL)on;
@end
@interface CGSettingSwitchCell : UITableViewCell

@property (nonatomic,assign)id<CGSettingSwitchCellDelegate>delegate;

@property (nonatomic,strong) CGSettingItem *item;

@end
