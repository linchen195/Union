//
//  Viwepager.m
//  Viwepager
//
//  Created by CORYIL on 16/3/23.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "Viwepager.h"

@interface Viwepager ()<UIScrollViewDelegate>
{
    UIView *domView;
}

@property (nonatomic,strong)UIScrollView *scrollView;

@property (nonatomic,strong)NSMutableArray *items;


@end

@implementation Viwepager

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images{

    if (self = [super initWithFrame:frame]) {
        
        [self _prepareItems:images];
        
        [self _loadSubviews];
        
        
        
    }
    return self;
}

/**
 *  准备内容项
 */
- (void)_prepareItems:(NSArray *)images{
    
    _items = [[NSMutableArray alloc]init];
    
    [_items addObject:[images lastObject]];
    
    for (UIImage *img in images) {
        
        [_items addObject:img];
    }
    [_items addObject:[images firstObject]];
}

/**
 *  加载滑动视图
 */
- (void)_loadSubviews{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    
    _scrollView.contentSize = CGSizeMake(_items.count * self.bounds.size.width, self.bounds.size.height);
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;

    _scrollView.delegate = self;
    
    //移动到2号位置
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.bounds.size.width,0,_scrollView.bounds.size.width,_scrollView.bounds.size.height) animated:NO];
    
    for (int i = 0; i<_items.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * _scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        
        imageView.image = [UIImage imageNamed:_items[i]] ;
        
        [_scrollView addSubview:imageView];
    }
    [self addSubview:_scrollView];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode: NSDefaultRunLoopMode];
}

- (void)timerAction{

    if (_scrollView.contentOffset.x == 0) {
        
        // 用户滑动到1号位置，此时必须跳转到倒二的位置
        [self scrollViewFirstLoaction];
        [self scrollViewTimeSliding];
        
    }else if (_scrollView.contentOffset.x == _scrollView.contentSize.width - _scrollView.bounds.size.width) {
        
        // 用户滑动到最后的位置，此时必须跳转到2号位置
        [self scrollViewLastLocation];
        [self scrollViewTimeSliding];
        
    }else{
        
        [self scrollViewTimeSliding];
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == 0) {
        
        [self scrollViewFirstLoaction];
    }else if (scrollView.contentOffset.x == scrollView.contentSize.width - scrollView.bounds.size.width) {
        
        // 用户滑动到最后的位置，此时必须跳转到2号位置
        [self scrollViewLastLocation];
    }
}

// 用户滑动到1号位置，此时必须跳转到倒二的位置
-(void)scrollViewFirstLoaction{
    
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.contentSize.width - 2 * _scrollView.bounds.size.width,0,_scrollView.bounds.size.width,_scrollView.bounds.size.height) animated:NO];
}

// 用户滑动到最后的位置，此时必须跳转到2号位置
-(void)scrollViewLastLocation{
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.bounds.size.width,0,_scrollView.bounds.size.width,_scrollView.bounds.size.height) animated:NO];
    
    
}
// 定时
-(void)scrollViewTimeSliding{
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + [UIScreen mainScreen].bounds.size.width, 0) animated:YES];
    
   
}

// 圆形分页小标志

//-(void)createPageDom:(NSArray *)array{
//    domView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 300, 30)];
//    domView.backgroundColor = [UIColor clearColor];
//    
//    CGFloat domWidth = array.count*13;
//    CGFloat marginX = ([UIScreen mainScreen].bounds.size.width-domWidth)/2;
//    
//    for (int count = 0; count<array.count; count++) {
//        
//        UIView *dom = [[UIView alloc]initWithFrame:CGRectMake(marginX+13*count, 11, 7, 7)];
//        dom.layer.cornerRadius = 3.5;
//        dom.backgroundColor = [UIColor cyanColor];
//        dom.tag = count;
//        [domView addSubview:dom];
//    }
//    [self addSubview:domView];
//    [self pageDomChange:0];
//}
//
//
//-(void)pageDomChange:(NSInteger)index{
//
//    for (UIView *dom in domView.subviews) {
//        
//        if (index == dom.tag) {
//            dom.backgroundColor = [UIColor redColor];
//        }else{
//            dom.backgroundColor = [UIColor cyanColor];
//        }
//        
//    }
//}

@end
