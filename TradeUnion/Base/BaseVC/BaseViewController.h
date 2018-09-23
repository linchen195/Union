//
//  BaseViewController.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIView *leftItemV;

@property (nonatomic,assign) BOOL popShowTabBar;
//隐藏左侧返回按钮
-(void)hideLeftItemButton;

@end
