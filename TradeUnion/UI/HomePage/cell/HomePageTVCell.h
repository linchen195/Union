//
//  HomePageCellTableViewCell.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/10.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTVModel.h"

@interface HomePageTVCell : UITableViewCell

@property (nonatomic,strong) UIImageView *thumbnailView;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *publishTime;
@property (nonatomic,strong) UILabel *commentNum;

// model
@property (nonatomic,strong) HomeTVModel *model;

-(CGFloat)cellHeight;
@end
