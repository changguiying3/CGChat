//
//  CGAddMenuCell.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGAddMenuCell.h"

@interface CGAddMenuCell ()

@property (nonatomic,strong) UIImageView *iconImageView;

@property (nonatomic,strong) UILabel *titleLabel;

@end
@implementation CGAddMenuCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.rightSeparatorSpace = 16;
        [self setBackgroundColor:[UIColor colorBlackForAddMenu]];
        UIView *selectedView = [[UIView alloc]init];
        [selectedView setBackgroundColor:[UIColor colorBlackForAddMenu]];
        [self setSelectedBackgroundView:selectedView];
        
        [self.contentView addSubview:self.iconImageView];///
        [self.contentView addSubview:self.titleLabel];
        
        [self m_addMasonry];
    }
    return self;
}
-(void)setItem:(CGAddMenuItem *)item{
    _item = item;
    [self.iconImageView setImage:[UIImage imageNamed:item.iconPath]];
    [self.titleLabel setText:item.title];
}

#pragma mark - Private Method -
-(void)m_addMasonry{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15.0f);
        make.centerY.mas_equalTo(self);
        make.height.and.width.mas_equalTo(32);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(10.0f);
        make.centerY.mas_equalTo(self.iconImageView);
    }];
}

#pragma mark - Getter
-(UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    }
    return _titleLabel;
}
@end
