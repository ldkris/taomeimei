//
//  TMRegisterVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRegisterVC.h"
#import "TMRegisterInputView.h"
#import "UIButton+Countdown.h"
#import "TMAgreementVC.h"
@interface TMRegisterVC ()
@property(nonatomic,strong)UIImageView *mBottomImageView;
@property(nonatomic,strong)TMRegisterInputView *mPhoneInputView;
@property(nonatomic,strong)TMRegisterInputView *mCodeInputView;
@property(nonatomic,strong)TMRegisterInputView *mInviteView;
@property(nonatomic,strong)TMRegisterInputView *mPWDInputView;

@property(nonatomic,strong)UIButton *mRegisterBtn;
@property(nonatomic,strong)UIButton *mAgreementBtn;
@property(nonatomic,strong)UILabel *mAgreementLable;
@end

@implementation TMRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(_isPWD){
        self.title = @"忘记密码";
    }else{
        self.title = @"注册";
    }

    [self.view addSubview:self.mBottomImageView];
    [self.view addSubview:self.mPhoneInputView];
    [self.view addSubview:self.mCodeInputView];
    [self.view addSubview:self.mInviteView];
    [self.view addSubview:self.mPWDInputView];
    [self.view addSubview:self.mRegisterBtn];
    [self.view addSubview:self.mAgreementBtn];
    [self.view addSubview:self.mAgreementLable];
    
    [self.mCodeInputView onclickGetCodeBtnWithBlock:^(UIButton *sender) {
        [sender CountdownWithSeconds:60 description:@"重新获取" compleBlock:^{
            [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mBottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    [self.mPhoneInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
    }];
    [self.mCodeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.equalTo(self.mPhoneInputView.mas_bottom);
    }];
    [self.mInviteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.equalTo(self.mCodeInputView.mas_bottom);
    }];
    [self.mPWDInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.top.equalTo(self.mInviteView.mas_bottom);
    }];
    
    [self.mRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.mPWDInputView.mas_bottom).with.offset(25);
    }];
    
    [self.mAgreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_centerX).with.offset(-10);
        make.top.equalTo(self.mRegisterBtn.mas_bottom).with.offset(15);
    }];
    
    [self.mAgreementLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mAgreementBtn.mas_centerY);
        make.right.equalTo(self.mAgreementBtn.mas_left);
    }];
}
#pragma mark getter
-(UIImageView *)mBottomImageView{
    if (_mBottomImageView == nil) {
        _mBottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tm_reg_db.png"]];
    }
    return _mBottomImageView;
}
-(TMRegisterInputView *)mPhoneInputView{
    if (_mPhoneInputView == nil) {
        _mPhoneInputView = [[TMRegisterInputView alloc]init];
        [_mPhoneInputView setImage:[UIImage imageNamed:@"tm_reg_dh"]];
        [_mPhoneInputView setPlaceholder:@"请输入手机号"];
    }
    
    return _mPhoneInputView;
}
-(TMRegisterInputView *)mCodeInputView{
    if (_mCodeInputView == nil) {
        _mCodeInputView = [[TMRegisterInputView alloc]init];
        [_mCodeInputView setImage:[UIImage imageNamed:@"login_pwd"]];
        [_mCodeInputView setPlaceholder:@"请输入验证码"];
        [_mCodeInputView setIsCode:YES];
    }
    
    return _mCodeInputView;
}
-(TMRegisterInputView *)mInviteView{
    if (_mInviteView == nil) {
        _mInviteView = [[TMRegisterInputView alloc]init];
        [_mPWDInputView setIsPassword:_isPWD];
        if (_isPWD) {
            [_mInviteView setImage:[UIImage imageNamed:@"login_pwd"]];
            [_mInviteView setPlaceholder:@"请输入密码"];
        }else{
            [_mInviteView setImage:[UIImage imageNamed:@"login_pwd"]];
            [_mInviteView setPlaceholder:@"请输入邀请人ID(选填)"];
        }
    }
    return _mInviteView;
}
-(TMRegisterInputView *)mPWDInputView{
    if (_mPWDInputView == nil) {
        _mPWDInputView = [[TMRegisterInputView alloc]init];
        [_mPWDInputView setImage:[UIImage imageNamed:@"tm_reg_yqr"]];
        if (_isPWD) {
            [_mPWDInputView setImage:[UIImage imageNamed:@"login_pwd"]];
            [_mPWDInputView setPlaceholder:@"请再次输入密码"];
            [_mPWDInputView setIsPassword:YES];
        }
        else
        {
            [_mPWDInputView setPlaceholder:@"请输入密码"];
            [_mPWDInputView setIsPassword:YES];
        }
     
    }
    
    return _mPWDInputView;
}
-(UIButton *)mRegisterBtn{
    if (_mRegisterBtn == nil) {
        _mRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mRegisterBtn setBackgroundImage:[UIImage imageNamed:@"icon_btn_bg_red"] forState:UIControlStateNormal];
        if (_isPWD) {
            [_mRegisterBtn setTitle:@"确 定" forState:UIControlStateNormal];
        }
        else
        {
            [_mRegisterBtn setTitle:@"注 册" forState:UIControlStateNormal];
        }
        [_mRegisterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mRegisterBtn.titleLabel setFont:DEFAULT_FONT(15)];
        [_mRegisterBtn setTitleEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
        [_mRegisterBtn addTarget:self action:@selector(onclickRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mRegisterBtn;
}
-(UIButton *)mAgreementBtn{
    if (_mAgreementBtn == nil) {
        _mAgreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _mAgreementBtn.hidden = _isPWD;
        [_mAgreementBtn setTitle:@"《用户使用及隐私协议》" forState:UIControlStateNormal];
        [_mAgreementBtn setTitleColor:[UIColor colorWithHexString:@"ff94ac"] forState:UIControlStateNormal];
        [_mAgreementBtn.titleLabel setFont:DEFAULT_FONT(11)];
        [_mAgreementBtn addTarget:self action:@selector(onclickAgreementBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mAgreementBtn;
}
-(UILabel *)mAgreementLable{
    if (_mAgreementLable == nil) {
        _mAgreementLable = [[UILabel alloc]init];
        _mAgreementLable.hidden = _isPWD;
        [_mAgreementLable setText:@"注册即表示同意"];
        [_mAgreementLable setFont:DEFAULT_FONT(11)];
        [_mAgreementLable setTextColor:[UIColor colorWithHexString:@"cbcbcb"]];
    }
    return _mAgreementLable;
}
#pragma mark event respose
-(void)onclickRegisterBtn:(UIButton *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)onclickAgreementBtn:(UIButton *)sender{
    TMAgreementVC *mAgreementVC = [[TMAgreementVC alloc]init];
    [self.navigationController pushViewController:mAgreementVC animated:YES];
}
@end
