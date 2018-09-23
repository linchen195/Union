//
//  UIView+TUExtension.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/8.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "UIView+TUExtension.h"

@implementation UIView (TUExtension)

// 快速根据xib创建View
+ (instancetype)lx_viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

-(CGSize)size{
    return self.frame.size;
}
-(void)setSize:(CGSize)size{
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
// 宽度
-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
// 高度
-(CGFloat)height{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
// 坐标X
-(CGFloat)x{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
// 坐标Y
-(CGFloat)y{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
// 中心X
-(CGFloat)centerX{
    return self.center.x;
}
-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
// 中心Y
-(CGFloat)centerY{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

// Move via offset
- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}

// Scaling
- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;	
}
// 设置View圆角
- (void)setViewRadios:(CGFloat)radios bouns:(BOOL)bouns boderWith:(CGFloat)boder boderColor:(UIColor*)color{
    self.layer.cornerRadius = radios;
    self.layer.masksToBounds = bouns;
    self.layer.borderWidth = boder;
    self.layer.borderColor = color.CGColor;
    
}

// view的viewControllerx
-(UIViewController *)viewController{
    // 查询 responder  直到 是ViewController为止
    UIResponder *respnder = self;
    do{
        respnder = respnder.nextResponder;
    }while (![respnder isKindOfClass:[UIViewController class]]);
    
    return (UIViewController*)respnder;
}


@end
