//
//  CGSearchController.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/19.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSearchController.h"

@implementation CGSearchController

-(instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        [self.searchBar setTintColor:[UIColor colorGreenDefault]];
        [self.searchBar setBarTintColor:[UIColor colorGrayBG]];
        [self.searchBar.layer setBorderWidth:BORDER_WIDTH_1PX];
        [self.searchBar.layer setBorderColor:[UIColor colorGrayBG].CGColor];
        UITextField *tf = [[[self.searchBar.subviews firstObject]subviews]lastObject];
        [tf.layer setMasksToBounds:YES];
        [tf.layer setBorderWidth:BORDER_WIDTH_1PX];
        [tf.layer setBorderColor:[UIColor colorGrayLine].CGColor];//layer层面上bordercolor的设置
        [tf.layer setCornerRadius:5.0f];
    }
    return self;
}

-(void)setShowVoiceButton:(BOOL)showVoiceButton{
    _showVoiceButton = showVoiceButton;
    if (showVoiceButton) {
        [self.searchBar setShowsBookmarkButton:YES];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice_HL"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    }else{
        [self.searchBar setShowsBookmarkButton:NO];
    }
}
@end
