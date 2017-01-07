//
//  TMRegisterInputView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/5.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRegisterInputView.h"
#import "UIButton+Countdown.h"
@implementation TMRegisterInputView

-(instancetype)init{
    self = [super init];
    if (self) {
        mImageView = [[UIImageView alloc]init];
        [mImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:mImageView];
        [mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(15);
        }];
        
        mTextField = [[UITextField alloc]init];
        [mTextField setFont:DEFAULT_FONT(14)];
        [mTextField addTarget:self action:@selector(textFieldDidChage:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:mTextField];
        [mTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(mImageView.mas_right).with.offset(11);
            make.height.mas_equalTo(40);
        }];
        
        mLineView = [[UIView alloc]init];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f2f2f2"]];
        [self addSubview: mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image;
    [mImageView setImage:image];
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    mTextField.placeholder = placeholder;
    [mTextField setValue:[UIColor colorWithHexString:@"8c8c8c"] forKeyPath:@"_placeholderLabel.textColor"];
    [mTextField setValue:DEFAULT_FONT(14) forKeyPath:@"_placeholderLabel.font"];
}
-(void)setIsPassword:(BOOL)isPassword{
    _isPassword = isPassword;
    if (isPassword) {
        [mTextField setSecureTextEntry:YES];
    }else{
        [mTextField setSecureTextEntry:NO];
    }
}
-(void)setIsCode:(BOOL)isCode{
    _isCode = isCode;
    if (isCode) {
        mCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [mCodeBtn.titleLabel setFont:DEFAULT_FONT(14)];
        [mCodeBtn setTitleColor:[UIColor colorWithHexString:@"ffaec1"] forState:UIControlStateNormal];

        [mCodeBtn addTarget:self action:@selector(onclickGetCodeBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mCodeBtn];
        [mCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.mas_equalTo(0);
        }];
    }
}
#pragma mark  event response
-(void)textFieldDidChage:(UITextField *)textField{
    self.resultStr = textField.text;
}
-(void)onclickGetCodeBtn:(UIButton *)sender{
    
    if (self.onclickGetCodeBtnBlock) {
        self.onclickGetCodeBtnBlock(sender);
    }
}
#pragma public
-(void)onclickGetCodeBtnWithBlock:(void(^)(UIButton *sender))block{
    self.onclickGetCodeBtnBlock = block;
}
@end
