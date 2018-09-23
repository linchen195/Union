//
//  UnionNavigationController.m
//  TradeUnion
//
//  Created by Kaka on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "UnionNavigationController.h"

@interface UnionNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation UnionNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
     //设置手势代理
    self.interactivePopGestureRecognizer.delegate = self;
    
    [self setupNavigationBar];
    // Do any additional setup after loading the view.
}


//手势代理
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}

//设置导航栏主题
- (void)setupNavigationBar{
    UINavigationBar *appearance = [UINavigationBar appearance];
    //统一设置导航栏颜色，如果单个界面需要设置，可以在viewWillAppear里面设置，在viewWillDisappear设置回统一格式。
    [appearance setBarTintColor:[UIColor colorWithHexString:@"fb9c0a"]];
    //导航栏title格式
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textAttribute];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        
        [[CustomTabBarVC shareInstance] hiddenTabbar];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)popToViewController
{
    if (self.viewControllers == 0) {
        
        [[CustomTabBarVC shareInstance] showTabbar];
    }
    [super popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
