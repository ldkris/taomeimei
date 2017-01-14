//
//  TMFeedBackVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/13.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMFeedBackVC.h"

@interface TMFeedBackVC ()

@end

@implementation TMFeedBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"意见反馈";
    
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commitBtn.frame = CGRectMake(0, 0, 44, 44);
    commitBtn.titleLabel.font = DEFAULT_FONT(15);
    commitBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [commitBtn addTarget:self action:@selector(commitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:commitBtn];
    [self.navigationItem setRightBarButtonItem:item];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}


- (void)commitBtnClick:(id)sender {
    LDLOG(@"提交");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
