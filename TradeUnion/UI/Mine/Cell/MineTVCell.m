//
//  MineThirdTVCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "MineTVCell.h"

@implementation MineTVCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(15, 17, self.width/2, 16)];
        [self.title setLabelTextColor:[UIColor colorWithHexString:@"666666"] textFontSize:15 textAlignment:NSTextAlignmentLeft];
        [self addSubview:self.title];
        
        self.icon_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-25, 17, 9, 15)];
        self.icon_arrow.image = [UIImage imageNamed:@"icon_arrow"];
        [self addSubview:self.icon_arrow];
        
        _separatorLine = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth, 1)];
        _separatorLine.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
        [self addSubview:_separatorLine];
        
        // 手机号 昵称
        self.subTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.title.frame)+5, 17, kScreenWidth/2, 16)];
        [self.subTitle setLabelTextColor:[UIColor colorWithHexString:@"333333"] textFontSize:15 textAlignment:NSTextAlignmentLeft];
        self.subTitle.hidden = YES;
        [self addSubview:self.subTitle];
    }
    return self;
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
