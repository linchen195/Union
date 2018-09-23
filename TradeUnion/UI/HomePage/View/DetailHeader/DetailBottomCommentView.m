//
//  DetailBottomCommentView.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/20.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "DetailBottomCommentView.h"

@interface DetailBottomCommentView () <UITextFieldDelegate>

// 键盘
@property (nonatomic, strong) LZBKeyBoardToolEmojiBar *keyboardView ;

@end

@implementation DetailBottomCommentView

#pragma mark 懒加载 键盘
- (LZBKeyBoardToolEmojiBar *)keyboardView
{
    if(_keyboardView == nil)
    {
//        __weak typeof(self) weakSelf = self;
        _keyboardView = [LZBKeyBoardToolEmojiBar showKeyBoardWithConfigToolBarHeight:0 sendTextCompletion:^(NSString *sendText) {
            
        }];
        [_keyboardView  setInputViewPlaceHolderText:@"请输入文字"];
    }
    return _keyboardView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setViewRadios:0 bouns:YES boderWith:1 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];
        self.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
        [self addSubview:self.keyboardView];
        
        [self createSubViews];
    }
    return self;
}
#pragma mark 评论输入框

-(void)createSubViews{
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(15, 10, kScreenWidth-120-18*3-30, 29)];
    [searchView setViewRadios:14.5 bouns:YES boderWith:1 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];
    _tap = [[UITapGestureRecognizer alloc] init];
    [searchView addGestureRecognizer:_tap];
    searchView.backgroundColor = [UIColor whiteColor];
    [self addSubview:searchView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 29)];
    label.text = @"写评论...";
    [label setLabelTextColor:[UIColor colorWithHexString:@"b0b0b0"] textFontSize:12 textAlignment:NSTextAlignmentLeft];
    [searchView addSubview:label];
    
    _commentIconBtn = [[HotButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(searchView.frame)+30, (self.height-18)/2, 18, 18)];
    [_commentIconBtn setBackgroundImage:[UIImage imageNamed:@"btn_message"] forState:UIControlStateNormal];
    [self addSubview:_commentIconBtn];
    // 收藏
    _collectionBtn = [[HotButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_commentIconBtn.frame)+30, (self.height-20)/2, 20, 20)];
    [_collectionBtn setBackgroundImage:[UIImage imageNamed:@"btn_collection"] forState:UIControlStateNormal];
    [self addSubview:_collectionBtn];
    // 分享
    _shareBtn = [[HotButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_collectionBtn.frame)+30, (self.height-18)/2, 18, 18)];
    [_shareBtn setBackgroundImage:[UIImage imageNamed:@"btn_share"] forState:UIControlStateNormal];
    [self addSubview:_shareBtn];
}

@end
