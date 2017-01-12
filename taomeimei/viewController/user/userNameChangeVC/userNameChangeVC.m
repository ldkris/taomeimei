//
//  userNameChangeVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "userNameChangeVC.h"

@interface userNameChangeVC ()

@end

@implementation userNameChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"修改昵称";
    self.view.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    self.userNameTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.userNameTextF.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 44, 44);
    saveBtn.titleLabel.font = DEFAULT_BOLD_FONT(15);
    saveBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:saveBtn];
    [self.navigationItem setRightBarButtonItem:item];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}

- (void)saveBtnClick:(id)sender {
    LDLOG(@"保存");
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
