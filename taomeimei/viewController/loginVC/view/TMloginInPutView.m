//
//  TMloginInPutView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMloginInPutView.h"

@implementation TMloginInPutView
-(instancetype)init{
    self = [super init];
    if (self) {
        _mImageView = [[UIImageView alloc]init];
        [_mImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_mImageView];
        [_mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.width.height.mas_equalTo(15);
            make.bottom.mas_equalTo(-5);
        }];
        
        _mTextField = [[UITextField alloc]init];
        _mTextField.font = DEFAULT_FONT(14);
        [_mTextField addTarget:self action:@selector(textFieldDidChage:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_mTextField];
        [_mTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_mImageView.mas_right).with.offset(11);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
            make.bottom.equalTo(_mImageView.mas_bottom).with.offset(8.5);
        }];
        
        _lineView = [[UIView alloc]init];
        [_lineView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image;
    [_mImageView setImage:image];
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    _mTextField.placeholder = placeholder;
    [_mTextField setValue:[UIColor colorWithHexString:@"8c8c8c"] forKeyPath:@"_placeholderLabel.textColor"];
    [_mTextField setValue:DEFAULT_FONT(14) forKeyPath:@"_placeholderLabel.font"];
}
-(void)setIsPassword:(BOOL)isPassword{
    if (isPassword) {
        [_mTextField setSecureTextEntry:YES];
    }else{
         [_mTextField setSecureTextEntry:NO];
    }
}
#pragma mark  event response
-(void)textFieldDidChage:(UITextField *)textField{
    self.resultStr = textField.text;
}
@end
