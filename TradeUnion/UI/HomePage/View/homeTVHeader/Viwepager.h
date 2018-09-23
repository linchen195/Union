//
//  Viwepager.h
//  Viwepager
//
//  Created by CORYIL on 16/3/23.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Viwepager : UIView

/**
 *  图片轮播器初始化方法
 *
 *  @param frame  控件结构
 *  @param images 图片数组
 *
 *  @return 图片轮播器
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images;

@end
