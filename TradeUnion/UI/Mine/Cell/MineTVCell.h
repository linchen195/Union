//
//  MineThirdTVCell.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineTVCell : UITableViewCell

@property (nonatomic,strong) UILabel *title;
// 昵称手机号
@property (nonatomic,strong) UILabel *subTitle;
// 箭头
@property (nonatomic,strong) UIImageView *icon_arrow;
// 分割线
@property (nonatomic,strong) UIView *separatorLine;

@end
