//
//  DetailHeaderView.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/18.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "DetailHeaderView.h"

@interface DetailHeaderView ()

@property (nonatomic,strong) UILabel *detailTitle;
@property (nonatomic,strong) UILabel *author;
@property (nonatomic,strong) UILabel *publishTime;

@end

@implementation DetailHeaderView

-(instancetype)initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    
    _detailTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, kScreenWidth-30, 20)];
    [_publishTime setLabelTextColor:[UIColor colorWithHexString:@"999999"] textFontSize:13 textAlignment:NSTextAlignmentLeft];
    _detailTitle.text = @"这里是标题";
    [self addSubview:_detailTitle];
        
    _author = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_detailTitle.frame)+5, kScreenWidth/2, 20)];
    [_author setLabelTextColor:[UIColor colorWithHexString:@"999999"] textFontSize:13 textAlignment:NSTextAlignmentCenter];
    _author.text = @"张三";
    [_author sizeToFit];
    [self addSubview:_author];
    
    _publishTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_author.frame)+15, _author.y, kScreenWidth/2, 20)];
    [_publishTime setLabelTextColor:[UIColor colorWithHexString:@"999999"] textFontSize:13 textAlignment:NSTextAlignmentLeft];
    _publishTime.text = @"2016-09-24 18:20";
    [self addSubview:_publishTime];

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_publishTime.frame)+10, kScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:line];
    
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.height, kScreenWidth, 5)];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"f3f6f6"];
    [self addSubview:bottomLine];
}
@end
