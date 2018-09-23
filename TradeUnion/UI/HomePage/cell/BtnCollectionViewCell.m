//
//  BtnCollectionViewCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/11.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BtnCollectionViewCell.h"

@implementation BtnCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews{
    
    // 按钮
    self.imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.width)];
    [self addSubview:self.imgV];
    
    // 按钮标题
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(-10, CGRectGetMaxY(self.imgV.frame)+10, self.width+20, 20)];
    self.title.font = [UIFont systemFontOfSize:15];
    self.title.textColor = [UIColor colorWithHexString:@"323232"];
    self.title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.title];
}

@end
