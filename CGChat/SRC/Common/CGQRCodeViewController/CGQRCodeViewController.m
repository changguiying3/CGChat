//
//  CGQRCodeViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/27.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGQRCodeViewController.h"
#import <UIImageView+WebCache.h>

#define SPACE_EDGE       20
#define WIDTH_AVATAR     68

@interface CGQRCodeViewController  ()

@property (nonatomic,strong) UIView *whiteBGView;

@property (nonatomic,strong) UIImageView *avatarImageView;

@property (nonatomic,strong) UILabel *usernameLabel;

@property (nonatomic,strong) UILabel *subTitleLabel;

@property (nonatomic,strong) UIImageView *qrCodeImageView;

@property (nonatomic,strong) UILabel *introductionLabel;

@end
@implementation CGQRCodeViewController

+(void)createQRCodeImageForString:(NSString *)str ans:(void (^)(UIImage *))ans{
    
}
-(void)viewDidLoad{
    [self.view addSubview:self.whiteBGView];
    [self.whiteBGView addSubview:self.avatarImageView];
    [self.whiteBGView addSubview:self.usernameLabel];
    [self.whiteBGView addSubview:self.subTitleLabel];
    [self.whiteBGView addSubview:self.qrCodeImageView];
    [self.whiteBGView addSubview:self.introductionLabel];
    
    [self m_addMasonry];
}

#pragma mark - Public Method -

-(void)saveQRCodeToSystemAlbum{
       [CGUIUtility captureScreenshotFromView:self.whiteBGView rect:self.whiteBGView.bounds finished:^(NSString *avatarPath) {
           NSString *path = [NSFileManager pathScreenshotImage:avatarPath];
           UIImage *image = [UIImage imageNamed:path];
           UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
       }];
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        [UIAlertView bk_alertViewWithTitle:@"错误" message:[NSString stringWithFormat:@"保存图片到系统相册失败\n%@",[error description]]];
    }else{
        [SVProgressHUD showWithStatus:@"已经保存到系统相册"];
    }
    
}

#pragma mark - Public Methods -
-(void)setAvaterURL:(NSString *)avaterURL{
    _avaterURL = avaterURL;
    [self.avatarImageView sd_setImageWithURL:CGURL(avaterURL)placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_PATH]];
}

-(void)setAvatarPath:(NSString *)avatarPath{
    _avatarPath = avatarPath;
    [self.avatarImageView setImage:avatarPath.length > 0 ? [UIImage imageNamed:avatarPath] : nil];
}

-(void)setUsername:(NSString *)username{
    _username = username;
    [self.usernameLabel setText:username];
}

-(void)setSubTitle:(NSString *)subTitle{
    _subTitle = subTitle;
    [self.subTitleLabel setText:subTitle];
    if (subTitle) {
        [self.usernameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.avatarImageView).mas_offset(8);
            make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(10);
            make.right.mas_lessThanOrEqualTo(self.whiteBGView).mas_offset(-SPACE_EDGE);
        }];
    }
}

-(void)setInstroduction:(NSString *)instroduction{
    _instroduction = instroduction;
    [self.introductionLabel setText:instroduction];
}

//-(void)setQrCode:(NSString *)qrCode{
//    _qrCode = qrCode;
//    
//}
#pragma mark - Private Method -
-(void)m_addMasonry{
    
    [self.whiteBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view).mas_offset(HEIGHT_NAVBAR / 2);
        make.width.mas_equalTo(self.view).multipliedBy(0.85);
        make.bottom.mas_equalTo(self.introductionLabel.mas_bottom).mas_offset(15);
//        make.bottom.mas_equalTo(self.qrCodeImageView).mas_offset(30);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self.whiteBGView).mas_offset(SPACE_EDGE);
        make.width.and.height.mas_equalTo(WIDTH_AVATAR);
    }];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.avatarImageView);
        make.right.mas_lessThanOrEqualTo(self.whiteBGView).mas_offset(-SPACE_EDGE);
    }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usernameLabel);
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).mas_offset(10);
    }];
    [self.qrCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.avatarImageView.mas_bottom).mas_offset(15);
        make.left.mas_equalTo(self.avatarImageView);
        make.right.mas_equalTo(self.whiteBGView.mas_right).mas_offset(-SPACE_EDGE);
        make.height.mas_equalTo(self.qrCodeImageView.mas_width);
    }];
    [self.introductionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.whiteBGView);
        make.top.mas_equalTo(self.qrCodeImageView.mas_bottom).mas_offset(15);
    }];
}
#pragma mark -Getter
-(UIView *)whiteBGView{
    if (_whiteBGView == nil) {
        _whiteBGView = [[UIView alloc]init];
        [_whiteBGView setBackgroundColor:[UIColor whiteColor]];
        [_whiteBGView.layer setMasksToBounds:YES];
        [_whiteBGView.layer setCornerRadius:2.0f];
        [_whiteBGView.layer setBorderWidth:BORDER_WIDTH_1PX];
        [_whiteBGView.layer setBorderColor:[UIColor blackColor].CGColor];
            
    }
    return _whiteBGView;
}

-(UIImageView *)avatarImageView{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc]init];
        [_avatarImageView.layer setMasksToBounds:YES];
        [_avatarImageView.layer setCornerRadius:3.0f];
        [_avatarImageView.layer setBorderWidth:BORDER_WIDTH_1PX];
        [_avatarImageView.layer setBorderColor:[UIColor colorGrayLine].CGColor];
    }
    return _avatarImageView;
}

-(UILabel *)usernameLabel{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc]init];
        //加粗
        [_usernameLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        [_usernameLabel setNumberOfLines:3];
    }
    return _usernameLabel;
}

-(UILabel *)subTitleLabel{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc]init];
        [_subTitleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_subTitleLabel setTextColor:[UIColor grayColor]];
    }
    return _subTitleLabel;
}

-(UIImageView *)qrCodeImageView{
    if (_qrCodeImageView == nil) {
        _qrCodeImageView = [[UIImageView alloc]init];
        [_qrCodeImageView setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:0.1]];
    }
    return _qrCodeImageView;
}

-(UILabel *)introductionLabel{
    if (_introductionLabel == nil) {
        _introductionLabel = [[UILabel alloc]init];
        [_introductionLabel setTextColor:[UIColor grayColor]];
        [_introductionLabel setFont:[UIFont systemFontOfSize:11.0f]];
    }
    return _introductionLabel;
}
@end
