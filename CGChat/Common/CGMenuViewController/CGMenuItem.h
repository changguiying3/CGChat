//
//  CGMenuItem.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/21.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  CGCreateMenuItem(IconPath, Title) [CGMenuItem createMenuWithIconPath:IconPath title:Title]

@interface CGMenuItem : NSObject
/** 左侧图标路径 */
@property (nonatomic,strong) NSString *iconPath;
/** 标题 */
@property (nonatomic,strong) NSString *title;
/** 副标题 */
@property (nonatomic,strong) NSString *subTitle;
/** 副图片url */
@property (nonatomic,strong) NSString *rightIconURL;
/** 是否显示红点 */
@property (nonatomic,assign) BOOL showRightRedPiont;

+ (CGMenuItem *) createMenuWithIconPath:(NSString *)iconPath title:(NSString *)title;
@end
