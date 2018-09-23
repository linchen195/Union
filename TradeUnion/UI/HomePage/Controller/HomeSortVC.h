//
//  HomeSortVC.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/12.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeSortVC;
typedef NS_ENUM(NSInteger, HomeSortVCStyle){
    HomeSortVCStyleTableView,
    HomeSortVCStyleCollectionView,
};

@interface HomeSortVC : BaseViewController

@property (nonatomic,strong) NSString *vcTitle;

// 列表视图模式还是书籍分类模式
@property (nonatomic) HomeSortVCStyle homeSortVCStyle;

@end
