//
//  HomePageCellTableViewCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/10.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "HomePageTVCell.h"

@implementation HomePageTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews{
    
    // cell 分割线
    UIView *lined = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth-30, 1)];
    lined.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:lined];
    
    //    缩略图
    self.thumbnailView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, (kScreenWidth-30)/3, (kScreenWidth-30)/3/3*2)];
    [self addSubview:self.thumbnailView];
    
    //    标题
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_thumbnailView.frame)+10, 10, kScreenWidth-40-_thumbnailView.width, _thumbnailView.height/2+10)];
    self.title.numberOfLines = 2;    
    self.title.textColor = [UIColor colorWithHexString:@"323232"];
    self.title.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.title];
    
    //    发表日期
    self.publishTime = [[UILabel alloc]initWithFrame:CGRectMake(self.title.x, CGRectGetMaxY(self.thumbnailView.frame)-15, 80, 15)];
    self.publishTime.font = [UIFont systemFontOfSize:12];
    self.publishTime.textColor = [UIColor colorWithHexString:@"999999"];
    [self addSubview:self.publishTime];
    
    //    评论数
    UIImageView *iconCommentImgV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.publishTime.frame) + 20, self.publishTime.y, 16, 15)];
    iconCommentImgV.image = [UIImage imageNamed:@"icon_comment"];
    [self addSubview:iconCommentImgV];
    self.commentNum = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconCommentImgV.frame)+5, self.publishTime.y, 50, 15)];
    self.commentNum.font = [UIFont systemFontOfSize:12];
    self.commentNum.textColor = [UIColor colorWithHexString:@"999999"];
    [self addSubview:self.commentNum];
}

#pragma mark -- 加载数据
-(void)setModel:(HomeTVModel *)model{

    self.thumbnailView.image = [UIImage imageNamed:model.thumbnail];
    self.title.text = model.title;
    self.publishTime.text = model.publishTime;
    self.commentNum.text = model.commentNum;

}

-(CGFloat)cellHeight{

    return CGRectGetMaxY(self.publishTime.frame)+10;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
