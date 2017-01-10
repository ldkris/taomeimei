//
//  TMFiltrateView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMFiltrateView.h"
#import "ASValueTrackingSlider.h"
@implementation TMFiltrateView{
    UILabel *mTitleLable;
    UILabel *mMinLable;
    UILabel *mMaxLable;
    ASValueTrackingSlider *mSlider;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        mTitleLable = [[UILabel alloc]init];
        [mTitleLable setFont:DEFAULT_FONT(14)];
        [mTitleLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self addSubview:mTitleLable];
        [mTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.top.mas_equalTo(20);
        }];
        mSlider = [[ASValueTrackingSlider alloc]init];
        [mSlider setThumbImage:[UIImage imageNamed:@"tm_ thumb"] forState:UIControlStateNormal];
        [mSlider setThumbImage:[UIImage imageNamed:@"tm_ thumb"] forState:UIControlStateFocused];
        [mSlider setMaxFractionDigitsDisplayed:0];
        mSlider.popUpViewColor = [UIColor colorWithHexString:@"ffaec1"];
        mSlider.font = [UIFont fontWithName:@"Menlo-Bold" size:22];
        mSlider.textColor = [UIColor whiteColor];
        [self addSubview:mSlider];
        [mSlider mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.equalTo(mTitleLable).with.offset(13);
        }];
        
        mMinLable = [[UILabel alloc]init];
        [mMinLable setFont:DEFAULT_FONT(14)];
        [mMinLable setTextColor:[UIColor colorWithHexString:@"999999"]];
        [self addSubview: mMinLable];
        [mMinLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mSlider.mas_bottom).with.offset(10);
            make.left.equalTo(mSlider.mas_left);
        }];
        
        mMaxLable = [[UILabel alloc]init];
        [mMaxLable setFont:DEFAULT_FONT(14)];
        [mMaxLable setTextColor:[UIColor colorWithHexString:@"999999"]];
        [self addSubview: mMaxLable];
        [mMaxLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mSlider.mas_bottom).with.offset(10);
            make.right.equalTo(mSlider.mas_right);
        }];
    }
    return self;
}
-(void)setMSliderMax:(int)mSliderMax{
    _mSliderMax = mSliderMax;
    [mMaxLable setText:[NSString stringWithFormat:@"%d",mSliderMax]];
    mSlider.maximumValue = mSliderMax;//设置最大值
}
-(void)setMSliderMin:(int)mSliderMin{
    _mSliderMin = mSliderMin;
    [mMinLable setText:[NSString stringWithFormat:@"%d",mSliderMin]];
    mSlider.minimumValue = mSliderMin;//设置最小值
}
-(void)setMTitleStr:(NSString *)mTitleStr{
    _mTitleStr = mTitleStr;
    [mTitleLable setText:mTitleStr];
}
-(void)setMValue:(int)mValue{
    _mValue = mValue;
    mSlider.value = mValue;
}

@end
