//
//  CGSettingItem.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGSettingItem : NSObject

#define CGCreateSettingItem(title) [CGSettingItem createItemWithTitle:title]
typedef NS_ENUM(NSInteger,CGSettingItemType){
    CGSettingItemTypeDefalut = 0,
    CGSettingItemTypeTitleButton,
    CGSettingItemTypeSwitch,
    CGSettingItemTypeOther,
};

/**
 *  主标题
 */
@property (nonatomic, strong) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *subTitle;

/**
 *  右图片(本地)
 */
@property (nonatomic, strong) NSString *rightImagePath;

/**
 *  右图片(网络)
 */
@property (nonatomic, strong) NSString *rightImageURL;

/**
 *  是否显示箭头（默认YES）
 */
@property (nonatomic, assign) BOOL showDisclosureIndicator;

/**
 *  停用高亮（默认NO）
 */
@property (nonatomic, assign) BOOL disableHighlight;

/**
 *  cell类型，默认default
 */
@property (nonatomic, assign) CGSettingItemType type;

+ (CGSettingItem *) createItemWithTitle:(NSString *)title;

- (NSString *) cellClassName;

@end
