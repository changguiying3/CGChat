//
//  CGSettingFooterTitleView.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingFooterTitleView.h"

@implementation CGSettingFooterTitleView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).mas_offset(15);
            make.right.mas_equalTo(self.contentView).mas_offset(-15);
            make.top.mas_equalTo(self.contentView).mas_offset(5.0f);
        }];
    }
    return self;
}
@end
