//
//  CGMineInfoAvatarCell.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/26.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGMineInfoAvatarCell.h"
#import <UIImageView+WebCache.h>

@interface CGMineInfoAvatarCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *avaterImageView;

@end

@implementation CGMineInfoAvatarCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.avaterImageView];
        [self m_addMasonry];
    }
    return self;
}

-(void)setItem:(CGSettingItem *)item{
    _item = item;
    [self.titleLabel setText:item.title];
    if (item.rightImagePath) {
        [self.avaterImageView setImage:[UIImage imageNamed:item.rightImagePath]];
    }else if (item.rightImageURL){
        [self.avaterImageView sd_setImageWithURL:CGURL(item.rightImageURL)placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_PATH]];
    }else{
        [self.avaterImageView setImage:nil];
    }
}

#pragma mark - Private Method -
-(void) m_addMasonry{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_lessThanOrEqualTo(self.avaterImageView.mas_left).mas_offset(-15);
    }];
    
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).mas_offset(9);
        make.bottom.mas_equalTo(self.contentView).mas_offset(-9);
        make.width.mas_equalTo(self.avaterImageView.mas_height);
    }];
}
#pragma mark - Getter
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

-(UIImageView *)avaterImageView{
    if (_avaterImageView == nil) {
        _avaterImageView = [[UIImageView alloc]init];
        [_avaterImageView.layer setMasksToBounds:YES];
        [_avaterImageView.layer setCornerRadius:4.0f];
    }
    return _avaterImageView;
}
@end
