//
//  UILabel+TUExtension.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TUExtension)

-(void)setLabelTextColor:(UIColor *)color textFontSize:(CGFloat)textFontSize textAlignment:(NSTextAlignment)textAlignment;

-(void)setLabelLineSpacing:(CGFloat)lineSpace textSpacing:(CGFloat)TextSpacing andTextString:(NSString *)text;

@end
