//
//  BookListView.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookListView : UIView

@property (nonatomic,strong) UICollectionView *bookCollectView;

-(instancetype)initWithFrame:(CGRect)frame withListImageAndTitle:(NSDictionary *)ImgTitleDic withEveryLineNum:(NSInteger)everyLineNum;

@end
