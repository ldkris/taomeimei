//
//  TMPickerView.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMPickerView.h"
#import "AppDelegate.h"
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface TMPickerView()<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)UIView *bottomView;//底部view
@property (strong,nonatomic) UIPickerView *datePicker;
@property (strong,nonatomic) NSArray *colorData;//颜色数据

@property (strong,nonatomic) NSString  *colorSelectedString;//选择颜色结果
@property (strong,nonatomic)NSString  *colorStr;//颜色
@property(nonatomic,strong)NSString *firstColor;
@end

@implementation TMPickerView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
        self.userInteractionEnabled = YES;
        UIButton *cancelB = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [cancelB addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelB];
    }
    return self;
}
+(instancetype)makeViewWithMaskDatePicker:(CGRect)frame setTitle:(NSString *)title Arr:(NSArray *)arr
{
    TMPickerView *mview = [[self alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window addSubview:mview];
    
    //添加底部view添加的window上
    mview.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 216 - 40, SCREEN_WIDTH, 216 + 40)];
    mview.bottomView.backgroundColor = [UIColor whiteColor];
    [delegate.window addSubview:mview.bottomView];
    
    if ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationLandscapeLeft) {
        mview.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT - 216 - 40, SCREEN_WIDTH, 216);
    }
    
    UIView *tottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    tottomView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    [mview.bottomView addSubview:tottomView];
    //添加取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0 , 60, 40);
    [cancelBtn setTitleColor:[UIColor colorWithHexString:@"056CE1"] forState:UIControlStateNormal];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:mview action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [tottomView addSubview:cancelBtn];
    //确定按钮
    UIButton *makeSureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    makeSureBtn.frame = CGRectMake(SCREEN_WIDTH - 60 , 0, 60, 40);
    [makeSureBtn setTitleColor:[UIColor colorWithHexString:@"056CE1"] forState:UIControlStateNormal];
    [makeSureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [makeSureBtn addTarget:mview action:@selector(makeSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [tottomView addSubview:makeSureBtn];
    
    //添加自定义一个选择器
    mview.datePicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0,40,SCREEN_WIDTH,216)];
    mview.datePicker.backgroundColor = [UIColor whiteColor];
    mview.datePicker.dataSource = mview;
    mview.datePicker.delegate = mview;
    //初始时间选择文字
    mview.colorData = arr;
    mview.colorStr =arr[0];
    mview.firstColor = arr[0];
    [mview.datePicker selectRow:0 inComponent:0 animated:NO];
    [mview.bottomView addSubview:mview.datePicker];
    
    return mview;
}
//取消
-(void)cancelBtn:(UIButton *)cancelBtn
{
    [self removeView];
}
- (void)tapGesture:(UITapGestureRecognizer*)sender{
    [self removeView];
}

-(void)makeSureBtn:(UIButton *)makeSureBtn
{
    //代理传值
    if ([_delegate respondsToSelector:@selector(getPickerViewValue:)]) {
        if (!self.colorStr) {
            self.colorStr = self.firstColor;
        }
        [_delegate getPickerViewValue:self.colorStr];
    }
    [self removeView];
}
//取消蒙层
-(void)removeView{
    [self.bottomView removeFromSuperview];
    [self removeFromSuperview];
}
#pragma mark pickDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //颜色
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.colorStr = self.colorData[row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.colorData.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.colorData[row];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
