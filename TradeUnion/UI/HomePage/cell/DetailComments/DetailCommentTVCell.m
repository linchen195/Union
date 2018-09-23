//
//  DetailCommentTVCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/18.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "DetailCommentTVCell.h"

@implementation DetailCommentTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //这个加上是为了解决约束冲突
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.contentView.frame = self.frame;

        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{

    // 头像
    self.userHeadImgV = UIImageView.new;
    [self addSubview:self.userHeadImgV];
    
    // 昵称
    self.userNickname = UILabel.new;
    [self.commentTime setLabelTextColor:[UIColor blackColor] textFontSize:15 textAlignment:NSTextAlignmentLeft];
    [self addSubview:self.userNickname];
    
    // 评论内容
    self.content = UILabel.new;
    [self.content setLabelTextColor:[UIColor colorWithHexString:@"565656"] textFontSize:15 textAlignment:NSTextAlignmentLeft];
    [self addSubview: self.content];
    
    // 评论时间
    self.commentTime = UILabel.new;
    [self.commentTime setLabelTextColor:[UIColor colorWithHexString:@"999999"] textFontSize:11 textAlignment:NSTextAlignmentLeft];
    [self addSubview:self.commentTime];
    
    self.separatorLine = UIView.new;
    self.separatorLine.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:self.separatorLine];
    
    // masonry 约束
    __weak typeof (self) weakSelf = self;
    
    [_userHeadImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(9);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    [_userNickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userHeadImgV.mas_top);
        make.left.equalTo(_userHeadImgV.mas_right).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(_userHeadImgV.mas_height);
    }];
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNickname.mas_bottom).offset(9);
        make.left.equalTo(_userNickname.mas_left);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        //        make.height.equalTo(@100.0);
    }];
    [_commentTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_content.mas_bottom).offset(9);
        make.left.equalTo(_content.mas_left);
        make.size.mas_equalTo(CGSizeMake(100, 13));
    }];
    [_separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commentTime.mas_bottom).offset(9);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@1);
    }];
    
}



-(void)setModel:(DetailCommentModel *)model{

    self.userHeadImgV.image = [UIImage imageNamed:model.userHead];
    
    self.userNickname.text = model.nickname;
    
    self.content.text = model.commentContent;
    [self.content setLabelLineSpacing:3 textSpacing:3 andTextString:self.content.text];
    self.content.text = model.commentContent;
    
    // 获取当前时间戳
    NSString *date2 = model.commentTime;
    NSDate *senddate = [NSDate date];
    NSString *date = [senddate getTimeString:date2 setDateFormat:@"YYYY-MM-dd"];
    
    self.commentTime.text = date;
    
    

    
    
    
//    self.maxHight = [self calculateCellHeight];
    
}
// cell 高度
- (CGFloat)calculateCellHeight{
    
    [self layoutSubviews];
        
    return CGRectGetMaxY(_commentTime.frame) + 10;
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
