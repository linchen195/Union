//
//  DetailBottomCommentView.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/20.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailBottomCommentView : UIView

@property (nonatomic,strong) UITapGestureRecognizer *tap;

@property(nonatomic,strong)HotButton *commentIconBtn;
@property(nonatomic,strong)HotButton *collectionBtn;
@property(nonatomic,strong)HotButton *shareBtn;

@end
