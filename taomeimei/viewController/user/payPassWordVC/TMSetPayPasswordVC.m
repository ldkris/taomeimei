//
//  TMSetPayPasswordVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMSetPayPasswordVC.h"

@interface TMSetPayPasswordVC ()
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;

@end

@implementation TMSetPayPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置支付密码";
    self.payPasswordTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.payPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
    self.repeatPasswordTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
    self.repeatPasswordTextF.leftViewMode = UITextFieldViewModeAlways;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}
- (IBAction)completeBtnClick:(id)sender {
    LDLOG(@"完成");
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
