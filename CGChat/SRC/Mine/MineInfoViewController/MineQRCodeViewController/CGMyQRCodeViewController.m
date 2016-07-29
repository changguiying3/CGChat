//
//  CGMyQRCodeViewController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/27.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMyQRCodeViewController.h"
#import "CGQRCodeViewController.h"

#define ACTIONTAG_SHOW_SCANNER     101

@interface CGMyQRCodeViewController ()

@property (nonatomic,strong) CGQRCodeViewController *qrCodeVC;

@end

@implementation CGMyQRCodeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorBlackBG]];
    [self.navigationItem setTitle:@"我的二维码"];
    
    [self.view addSubview:self.qrCodeVC.view];
    [self addChildViewController:self.qrCodeVC];
    UIBarButtonItem *righrBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_more"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:righrBarButtonItem];
    [self setUser:[CGUserHelper sharedHelper].user];
}

-(void)setUser:(CGUser *)user{
    _user = user;
    self.qrCodeVC.avaterURL = user.avatarURL;
    self.qrCodeVC.username = self.user.showName;
    self.qrCodeVC.subTitle = self.user.detailInfo.location;
    self.qrCodeVC.qrCode = self.user.userID;
    self.qrCodeVC.instroduction = @"扫一扫上面的二维码图案，加我微信";
}

#pragma mark - Event Response -
-(void)rightBarButtonDown:(UIBarButtonItem *)sender{
    UIActionSheet *actionSheet;
    if ([self.navigationController findViewController:@"CGScanningViewController"]) {
        actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"换个样式", @"保存图片", nil];
    }else{
        actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"换个样式", @"保存图片", @"扫描二维码", nil];
        actionSheet.tag = ACTIONTAG_SHOW_SCANNER;
    }
    [actionSheet showInView:self.view];
}

#pragma mark - Getter -
-(CGQRCodeViewController *)qrCodeVC{
    if (_qrCodeVC == nil) {
        _qrCodeVC = [[CGQRCodeViewController alloc]init];
    }
    return _qrCodeVC;
}
@end
