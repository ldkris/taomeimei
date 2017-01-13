//
//  TMDataPickerView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMDataPickerView.h"

@implementation TMDataPickerView{
    UIPickerView *mPicker;
    UIView *mContView;
    UIButton *mComfigBtn;
    UIButton *mCancelBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5f];
        
        mContView = [[UIView alloc]init];
        [mContView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:mContView];
        [mContView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(250);
        }];
        mPicker = [[UIPickerView alloc]init];
        [mPicker setDelegate:self];
        [mPicker setDataSource:self];
        [mContView addSubview:mPicker];
        [mPicker mas_makeConstraints:^(MASConstraintMaker *make) {
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
#pragma makr getter

-(void)setMPickerDataSoure:(NSArray *)mPickerDataSoure{
    _mPickerDataSoure = mPickerDataSoure;
    [mPicker reloadAllComponents];
}
#pragma mark event reponse
-(void)onclickCancelBtn:(UIButton *)sender{
    [self removeFromSuperview];
}
-(void)onclickComfigBtn:(UIButton *)sender{
    [self removeFromSuperview];
}
#pragma Mark -- UIPickerViewDataSource
// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.mPickerDataSoure) {
           return  self.mPickerDataSoure.count;
    }
    return 1;
}
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.mPickerDataSoure) {
        return  self.mPickerDataSoure[row];
    }
    return @"";
}
#pragma Mark -- UIPickerViewDelegate
// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return 180;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self removeFromSuperview];
}
@end
