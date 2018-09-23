//
//  LoginTextField.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/21.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "LoginTextField.h"

@interface LoginTextField ()
@property (nonatomic,assign)CGSize leftViewSize;
@property (nonatomic,strong)UIImage *image;
@end

@implementation LoginTextField

-(instancetype)initWithFrame:(CGRect)frame withLeftViewSize:(CGSize)size withIconImage:(UIImage *)image isBorder:(BOOL)isBorder{

    if (self=[super initWithFrame:frame]) {
        _leftViewSize = size;
        _image = image;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.returnKeyType = UIReturnKeyDone;
        [self createSubViews];
        // 边框
        if (isBorder) {
            [self setViewRadios:0 bouns:YES boderWith:1 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];
        }else{
        
        }
    }
    return self;
}
-(void)createSubViews{
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 35, self.height)];
    CGFloat width = _leftViewSize.width;
    CGFloat height = _leftViewSize.height;
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake((35-width)/2, (self.height-height)/2, width, height)];
    icon.image = _image;
    [leftView addSubview:icon];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
