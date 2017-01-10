//
//  TMNavigationController.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMNavigationController.h"

@interface TMNavigationController ()

@end

@implementation TMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    //标题颜色
    [self.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    UIImage *backgroundImage = [UIImage imageNamed:@"nav_bg"];
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    viewController.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    UIViewController* vc = [super popViewControllerAnimated:animated];
    vc.hidesBottomBarWhenPushed = NO;
    self.tabBarController.tabBar.hidden = YES;
    return vc;
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
