//
//  UIButton+TUExtension.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/21.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "UIButton+TUExtension.h"

@implementation UIButton (TUExtension)

-(void)setButtonTitle:(NSString *)title titleColor:(UIColor *)color titleFontSize:(CGFloat)size titleAlignment:(UIControlContentHorizontalAlignment)contentHorizontalalignment{

    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:size];
    self.contentHorizontalAlignment = contentHorizontalalignment;
}

@end
