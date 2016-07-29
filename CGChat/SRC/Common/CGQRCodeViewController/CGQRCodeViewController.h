//
//  CGQRCodeViewController.h
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/27.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGViewController.h"

@interface CGQRCodeViewController : CGViewController
/** 信息页元素 － 头像url */
@property (nonatomic,copy) NSString *avaterURL;
/** 头像Path */
@property (nonatomic,copy) NSString *avatarPath;
/** 用户名 */
@property (nonatomic,copy) NSString *username;
/** 副标题（如地址） */
@property (nonatomic,copy) NSString *subTitle;
/** 底部说明 */
@property (nonatomic,copy) NSString *instroduction;
/** 二维码字符串 */
@property (nonatomic,copy) NSString *qrCode;

/**
 *  根据str创建二维码
 *
 *  @param str 字符串
 *  @param ans 创建完成的回调（异步）
 */
+(void)createQRCodeImageForString:(NSString *)str ans:(void (^)(UIImage *ansImage))ans;
/**
 *  将照片保存到系统相册中
 */
-(void)saveQRCodeToSystemAlbum;
@end
