//
//  BookCollectionViewCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BookCollectionViewCell.h"

@implementation BookCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    _bookImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.width/3*4)];
    _bookImgV.image = [UIImage imageNamed:@"img_book"];
    [self addSubview:_bookImgV];
    
    _bookTitle = [[UILabel alloc]initWithFrame:CGRectMake(-5, CGRectGetMaxY(_bookImgV.frame)+5, self.width+10, 20)];
    _bookTitle.font = [UIFont systemFontOfSize:15];
    _bookTitle.textColor = [UIColor colorWithHexString:@"323232"];
    _bookTitle.textAlignment =  NSTextAlignmentCenter;
    _bookTitle.text = @"《两学一做》";
    [self addSubview:_bookTitle];
}

@end
