//
//  TMPayPasswordVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMPayPasswordVC.h"
#import "TMSetPayPasswordVC.h"

@interface TMPayPasswordVC ()

@property (weak, nonatomic) IBOutlet UIButton *getAuthCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;


@end

@implementation TMPayPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置支付密码";
    
    self.phoneTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.phoneTextF.leftViewMode = UITextFieldViewModeAlways;
    self.authCodeTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.authCodeTextF.leftViewMode = UITextFieldViewModeAlways;
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}
- (IBAction)getAuthCodeBtnClick:(id)sender {
    LDLOG(@"获取验证码");
}

- (IBAction)nextBtnClick:(id)sender {
    TMSetPayPasswordVC *setVC = [[TMSetPayPasswordVC alloc] initWithNibName:@"TMSetPayPasswordVC" bundle:nil];
    [self.navigationController pushViewController:setVC animated:YES];
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
