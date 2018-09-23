//
//  UIView+TUExtension.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TUExtension)

/**
 *  快速根据xib创建View
 */
+ (instancetype)lx_viewFromXib;


/**
 *  快速设置控件的位置
 */
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
- (void)setViewRadios:(CGFloat)radios bouns:(BOOL)bouns boderWith:(CGFloat)boder boderColor:(UIColor*)color;
@property (nonatomic,weak,readonly) UIViewController *viewController;

@end
