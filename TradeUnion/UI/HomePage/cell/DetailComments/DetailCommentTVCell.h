//
//  DetailCommentTVCell.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/18.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailCommentModel.h"

@interface DetailCommentTVCell : UITableViewCell
// 头像
@property (nonatomic,strong) UIImageView *userHeadImgV;
// 昵称
@property (nonatomic,strong) UILabel *userNickname;
// 评论内容
@property (nonatomic,strong) UILabel *content;
// 时间
@property (nonatomic,strong) UILabel *commentTime;
// 分割线
@property (nonatomic,strong) UIView *separatorLine;

@property (nonatomic,strong) DetailCommentModel *model;

/**
 *  对model 赋值后调用这个方法可以获取到高度 注意 一定要赋值之后 才要调用
 *
 *  @return cell的高度
 */
- (CGFloat)calculateCellHeight;

@end
