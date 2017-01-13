//
//  TMChatVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/13.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMChatVC.h"
#import "TMBaseTabbarVC.h"
@interface TMChatVC ()<EaseMessageViewControllerDelegate, EaseMessageViewControllerDataSource>

@end

@implementation TMChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showRefreshHeader = YES;
    self.delegate = self;
    self.dataSource = self;
    
    [[EaseBaseMessageCell appearance] setAvatarSize:30.f];
    [[EaseBaseMessageCell appearance] setAvatarCornerRadius:15.0f];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onclickGoBack:)];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self hideZJTbar];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onclickGoBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)hideZJTbar{
    if ([self.tabBarController isKindOfClass:[TMBaseTabbarVC class]]) {
        TMBaseTabbarVC *tempVC = (TMBaseTabbarVC *)self.tabBarController;
        self.tabBarController.tabBar.hidden = YES;
        tempVC.mBarView.hidden =YES;
        self.tabBarController.tabBar.hidden = YES;
    }
}

@end
