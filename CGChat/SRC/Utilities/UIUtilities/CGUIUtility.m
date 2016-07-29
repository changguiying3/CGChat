//
//  CGUIUtility.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGUIUtility.h"

static UILabel *hLabel = nil;

@implementation CGUIUtility

+(CGFloat)getTextHeightOfText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
    if (hLabel == nil) {
        hLabel = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [hLabel setNumberOfLines:0];
    }
    [hLabel setWidth:width];
    [hLabel setFont:font];
    [hLabel setText:text];
    //根据文字或者图像来返回尺寸大小
    return [hLabel sizeThatFits:CGSizeMake(width, MAXFLOAT)].height;
}

+(void)captureScreenshotFromView:(UIView *)view rect:(CGRect)rect finished:(void (^)(NSString *))finished{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 2.0);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        //加载图像的数据
        CGImageRef imageRef = image.CGImage;
        CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, CGRectMake(rect.origin.x * 2, rect.origin.y * 2, rect.size.width * 2, rect.size.height * 2));
        UIImage *anImage = [[UIImage alloc]initWithCGImage:imageRef];
        NSData *imageViewData = UIImagePNGRepresentation(anImage);
        NSString *imageName = [NSString stringWithFormat:@"%.0lf.png",[NSDate date].timeIntervalSince1970 * 10000];
        NSString *savedImagePath = [NSFileManager pathScreenshotImage:imageName];
        [imageViewData writeToFile:savedImagePath atomically:YES];
        CGImageRelease(imageRefRect);
        dispatch_async(dispatch_get_main_queue(), ^{
            finished(imageName);
        });
    });
}
@end
