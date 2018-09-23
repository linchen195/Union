//
//  ToolCollectionViewCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/15.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "ToolCollectionViewCell.h"

@implementation ToolCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    
//    [self setViewRadios:0 bouns:YES boderWith:0.5 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];

    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width-22)/2, (self.height-57)/2, 22, 22)];
    [self addSubview:_imageView];
    
    _title = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame)+15, self.width, 20)];
    [_title setLabelTextColor:[UIColor colorWithHexString:@"424c5a"] textFontSize:17 textAlignment:NSTextAlignmentCenter];
    [self addSubview:_title];
    
    // 边线
    UIView *rightLine = [[UIView alloc]initWithFrame:CGRectMake(self.width-1, 0, 1, self.height)];
    rightLine.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:rightLine];
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:bottomLine];
}
@end
