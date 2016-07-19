//
//  CGAddMenuView.m
//  CGChat
//
//  Created by 常桂盈的Mac on 16/7/18.
//  Copyright © 2016年 Gui Ying Chang. All rights reserved.
//

#import "CGAddMenuView.h"
#import "CGAddMenuCell.h"
#import "CGAddMenuHelper.h"

#define     WIDTH_TABLEVIEW             140.0f
#define     HEIGHT_TABLEVIEW_CELL       45.0f

@interface CGAddMenuView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) CGAddMenuHelper *helper;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *data;

@end
@implementation CGAddMenuView

-(instancetype)init{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.tableView];
        
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:panGR];
        
        [self.tableView registerClass:[CGAddMenuCell class] forCellReuseIdentifier:@"CGAddMenuCell"];
        self.data = self.helper.menuData;
    }
    return self;
}

-(void)showInView:(UIView *)view{
    [view addSubview:self];
    [self setNeedsDisplay];
    [self setFrame:view.bounds];
    
    CGRect rect = CGRectMake(view.width - WIDTH_TABLEVIEW - 5, HEIGHT_NAVBAR + HEIGHT_STATUSBAR + 10, WIDTH_TABLEVIEW, self.data.count * HEIGHT_TABLEVIEW_CELL);
    [self.tableView setFrame:rect];
}

-(BOOL)isShow{
    return self.superview != nil;
}
-(void)dismiss{
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            [self setAlpha:1.0];
        }
    }];
    }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

#pragma mark - Delegate -
//MARK:UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGAddMenuItem *item = [self.data objectAtIndex:indexPath.row];
    CGAddMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGAddMenuCell"];
    [cell setItem:item];
    return cell;
}

//MARK:UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",[self.data objectAtIndex:indexPath.row]);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return HEIGHT_TABLEVIEW_CELL;
}

#pragma mark - Private Method
-(void)drawRect:(CGRect)rect{
    CGFloat startX = self.width - 27;
    CGFloat startY = HEIGHT_STATUSBAR + HEIGHT_NAVBAR + 3;
    CGFloat endY = HEIGHT_STATUSBAR + HEIGHT_NAVBAR + 10;
    CGFloat width = 6;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, startX + width, endY);
    CGContextAddLineToPoint(context, startX - width, endY);
    CGContextClosePath(context);
    [[UIColor colorBlackForAddMenu] setFill];
    [[UIColor colorBlackForAddMenu] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}
#pragma mark - Getter
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        [_tableView setScrollEnabled:NO];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setBackgroundColor:[UIColor colorBlackForAddMenu]];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView.layer setMasksToBounds:YES];//tableView的外框
        [_tableView.layer setCornerRadius:3.0f];
    }
    return _tableView;
}

-(CGAddMenuHelper *)helper{
    if (_helper == nil) {
        _helper = [[CGAddMenuHelper alloc]init];
    }
    return _helper;
}
@end
