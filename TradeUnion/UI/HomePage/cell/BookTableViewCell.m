//
//  BookTableViewCell.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BookTableViewCell.h"
#import "BookListView.h"

@interface BookTableViewCell ()

@property(nonatomic,strong)BookListView *bookView;

@end

@implementation BookTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.height = (((kScreenWidth-15*(3+1))/3/3*4+25)*2+15*3);
        [self createSubViews];
    }
    return self;
}


-(void)createSubViews{
    
    _bookView = [[BookListView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.height) withListImageAndTitle:@{@"title":@"《两学一做》",@"img":@"img_book"} withEveryLineNum:3];
    [self addSubview:_bookView];
    
    // cell 分割线
    UIView *lined = [[UIView alloc]initWithFrame:CGRectMake(15, 0, kScreenWidth-30, 1)];
    lined.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self addSubview:lined];
}

-(CGFloat)cellHeight{

    return CGRectGetMaxY(_bookView.frame);
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
