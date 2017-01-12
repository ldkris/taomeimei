//
//  TMDatePickView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMDatePickView.h"

@implementation TMDatePickView{
    UIView *mContView;
    UIButton *mComfigBtn;
    UIButton *mCancelBtn;
}
-(UIDatePicker *)mPicker{
    if (_mPicker == nil) {
        [_mPicker setBackgroundColor:[UIColor whiteColor]];
        _mPicker = [[UIDatePicker alloc]init];
        [_mPicker setDate:[NSDate date]];
        _mPicker.datePickerMode = UIDatePickerModeDateAndTime;
        [_mPicker setMinimumDate:[NSDate date]];
    }
    return _mPicker;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        mContView = [[UIView alloc]init];
        [mContView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:mContView];
        [mContView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(250);
        }];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5f];
        [mContView addSubview:self.mPicker];
        [self.mPicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(200);
        }];
        
        mComfigBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mComfigBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [mComfigBtn.titleLabel setFont:DEFAULT_FONT(14)];
        [mComfigBtn addTarget:self action:@selector(onclickComfigBtn:) forControlEvents:UIControlEventTouchUpInside];
        [mComfigBtn setTitle:@"确定" forState:UIControlStateNormal];
        [mContView addSubview:mComfigBtn];
        [mComfigBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(50);
        }];
        
        mCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mCancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [mCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [mCancelBtn addTarget:self action:@selector(onclickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
        [mCancelBtn.titleLabel setFont:DEFAULT_FONT(14)];
        [mContView addSubview:mCancelBtn];
        [mCancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(50);
        }];
    }
    return self;
}
#pragma mark event reponse
-(void)onclickCancelBtn:(UIButton *)sender{
    [self removeFromSuperview];
}
-(void)onclickComfigBtn:(UIButton *)sender{
    [self removeFromSuperview];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self removeFromSuperview];
}
@end
