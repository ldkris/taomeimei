//
//  loginVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "loginVC.h"
#import "TMloginInPutView.h"
#import "TMRegisterVC.h"
@interface loginVC ()
@property(nonatomic,strong)UIImageView *mTopBGImgView;
@property(nonatomic,strong)TMloginInPutView *mUserInputView;
@property(nonatomic,strong)TMloginInPutView *mPwdInputView;

@property(nonatomic,strong)UIButton *mLoginBtn;
@property(nonatomic,strong)UIButton *mRegisterBtn;
@property(nonatomic,strong)UIButton *mForgoteBtn;
@end

@implementation loginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.mTopBGImgView];
    [self.view addSubview:self.mUserInputView];
    [self.view addSubview:self.mPwdInputView];
    [self.view addSubview:self.mLoginBtn];
    [self.view addSubview:self.mRegisterBtn];
    [self.view addSubview:self.mForgoteBtn];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self.mTopBGImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
    }];
    [self.mUserInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mTopBGImgView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(46);
        make.right.mas_equalTo(-46);
        make.height.mas_equalTo(40);
    }];
    [self.mPwdInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mUserInputView.mas_bottom).with.offset(20);
        make.left.mas_equalTo(46);
        make.right.mas_equalTo(-46);
        make.height.mas_equalTo(40);
    }];
    [self.mLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mPwdInputView.mas_bottom).with.offset(42.5);
        make.centerX.mas_equalTo(0);
    }];
    [self.mRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mLoginBtn.mas_bottom).with.offset(25);
        make.centerX.mas_equalTo(0);
    }];
    [self.mForgoteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mRegisterBtn.mas_bottom).with.offset(25);
        make.centerX.mas_equalTo(0);
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark getter
-(UIImageView *)mTopBGImgView{
    if (_mTopBGImgView == nil) {
        _mTopBGImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tm_login_topbg.png"]];
    }
    return _mTopBGImgView;
}
-(TMloginInPutView *)mUserInputView{
    if (_mUserInputView == nil) {
        _mUserInputView = [[TMloginInPutView alloc]init];
        [_mUserInputView setImage:[UIImage imageNamed:@"login_user.png"]];
        [_mUserInputView setPlaceholder:@"用户名"];
    }
    return _mUserInputView;
}
-(TMloginInPutView *)mPwdInputView{
    if (_mPwdInputView == nil) {
        _mPwdInputView = [[TMloginInPutView  alloc]init];
        [_mPwdInputView setImage:[UIImage imageNamed:@"login_pwd.png"]];
        [_mPwdInputView setPlaceholder:@"密码"];
        [_mPwdInputView setIsPassword:YES];
    }
    return _mPwdInputView;
}
-(UIButton *)mLoginBtn{
    if (_mLoginBtn == nil) {
        _mLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mLoginBtn setBackgroundImage:[UIImage imageNamed:@"icon_btn_bg_red"] forState:UIControlStateNormal];
        [_mLoginBtn setTitle:@"登 录" forState:UIControlStateNormal];
        [_mLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mLoginBtn.titleLabel setFont:DEFAULT_FONT(15)];
        [_mLoginBtn setTitleEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        [_mLoginBtn addTarget:self action:@selector(onclickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mLoginBtn;
}
-(UIButton *)mRegisterBtn{
    if (_mRegisterBtn == nil) {
        _mRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mRegisterBtn setBackgroundImage:[UIImage imageNamed:@"icon_btn_bg"] forState:UIControlStateNormal];
        [_mRegisterBtn setTitle:@"注 册" forState:UIControlStateNormal];
        [_mRegisterBtn setTitleColor:[UIColor colorWithHexString:@"ffaec1"] forState:UIControlStateNormal];
        [_mRegisterBtn.titleLabel setFont:DEFAULT_FONT(15)];
        [_mRegisterBtn addTarget:self action:@selector(onclickRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mRegisterBtn;
}
-(UIButton *)mForgoteBtn{
    if (_mForgoteBtn == nil) {
        _mForgoteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mForgoteBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_mForgoteBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_mForgoteBtn.titleLabel setFont:DEFAULT_FONT(14)];
        [_mForgoteBtn addTarget:self action:@selector(onclickForgoteBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mForgoteBtn;
}
#pragma mark public
-(void)keyboardWillHide:(NSNotification *)notification{
    [super keyboardWillHide:notification];
   // NSDictionary *userInfo = [notification userInfo];
    //CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame  = CGRectMake(0, 0, MainScreenFrame_Width, MainScreenFrame_Height);
    }];
}
-(void)keyboardWillShow:(NSNotification *)notification{
    [super keyboardWillShow:notification];
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame  = CGRectMake(0, -keyboardRect.size.height, MainScreenFrame_Width, MainScreenFrame_Height);
    }];
}
#pragma mark event response
-(void)onclickLoginBtn:(UIButton *)sender{

}
-(void)onclickRegisterBtn:(UIButton *)sender{
    TMRegisterVC *mRegisterVC = [[TMRegisterVC alloc]init];
    [self.navigationController pushViewController:mRegisterVC animated:YES];
}
-(void)onclickForgoteBtn:(UIButton *)sender{
    
}
@end
