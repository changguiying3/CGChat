//
//  CGSettingSwitchCell.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/25.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGSettingSwitchCell.h"

@interface CGSettingSwitchCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UISwitch *cellSwitch;

@end
@implementation CGSettingSwitchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setAccessoryView:self.cellSwitch];
        [self.contentView addSubview:self.titleLabel];
        [self m_addMasonry];
    }
    return self;
}

-(void)setItem:(CGSettingItem *)item{
    _item = item;
    [self.titleLabel setText:item.title];
}

#pragma mark - Event Response -
-(void)switchChangeStatus:(UISwitch *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(settingSwitchCellForItem:didChangeStatus:)]) {
        [_delegate settingSwitchCellForItem:self.item didChangeStatus:sender.on];
    }
}
-(void)m_addMasonry{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(-15);
    }];
    
}
#pragma mark - Getter
-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

-(UISwitch *)cellSwitch{
    if (_cellSwitch == nil) {
        _cellSwitch = [[UISwitch alloc]init];
        [_cellSwitch addTarget:self action:@selector(switchChangeStatus:) forControlEvents:UIControlEventValueChanged];
    }
    return _cellSwitch;
}
@end
