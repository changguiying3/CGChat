//
//  CGSettingGroup.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGSettingItem.h"

#define CGCreateSettingGroup(Header, Footer, Items)  [CGSettingGroup createGroupWithHeaderTitle:Header footerTitle:Footer items:[NSMutableArray arrayWithArray:Items]];

@interface CGSettingGroup : NSObject

/**头部标题 */
@property (nonatomic,copy) NSString *headerTitle;
/** 尾部标题 */
@property (nonatomic,copy) NSString *footerTitle;
/**section 元素 */
@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, assign, readonly) CGFloat headerHeight;

@property (nonatomic, assign, readonly) CGFloat footerHeight;

@property (nonatomic, assign, readonly) NSUInteger count;

+ (CGSettingGroup *)createGroupWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle items:(NSMutableArray *)items;

- (instancetype)objectAtIndex:(NSUInteger)index;

- (NSInteger)indexOfObject:(id)obj;

-(void)removeObject:(id)obj;

@end
