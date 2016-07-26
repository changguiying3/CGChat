//
//  CGSettingHeaderTitleView.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingHeaderTitleView.h"

@implementation CGSettingHeaderTitleView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    [self.contentView addSubview:self.titleLabel];
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).mas_offset(15);
            make.right.mas_equalTo(self.contentView).mas_offset(-15);
            make.bottom.mas_equalTo(self.contentView).mas_offset(-5.0f);
        }];
    }
    return self;
}
-(void)setText:(NSString *)text{
    _text = text;
    [self.titleLabel setText:text];
}

#pragma mark - Getter
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor redColor]];
        [_titleLabel setFont:[UIFont fontSettingHeaderAndFooterTitle]];
        [_titleLabel setNumberOfLines:0];
    }
    return _titleLabel;
}
@end
