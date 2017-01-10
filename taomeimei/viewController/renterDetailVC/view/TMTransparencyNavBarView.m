//
//  TMTransparencyNavBarView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTransparencyNavBarView.h"

@implementation TMTransparencyNavBarView{
    UILabel *mTitleLable;
    UIButton *mBackBtn;
    UIButton *mMoreBtn;
    UIImageView *mBgImageView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        mBgImageView = [[UIImageView alloc]init];
        mBgImageView.alpha = 0.0f;
        [self addSubview:mBgImageView];
        [mBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        mTitleLable = [[UILabel alloc]init];
        [mTitleLable setTextColor:[UIColor whiteColor]];
        [mTitleLable setFont:DEFAULT_BOLD_FONT(15)];
        [self addSubview:mTitleLable];
        [mTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(35);
        }];
        
        mBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mBackBtn addTarget:self action:@selector(onclickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mBackBtn];
        [mBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25);
            make.left.mas_equalTo(10);
            make.height.with.mas_equalTo(40);
        }];
        
        mMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mMoreBtn addTarget:self action:@selector(onclickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mMoreBtn];
        [mMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25);
            make.right.mas_equalTo(-10);
            make.height.with.mas_equalTo(40);
        }];
    }
    return self;
}

-(void)setMTitle:(NSString *)mTitle{
    _mTitle = mTitle;
    [mTitleLable setText:mTitle];
}
-(void)setMBackBarImage:(UIImage *)mBackBarImage{
    _mBackBarImage = mBackBarImage;
    [mBackBtn setImage:mBackBarImage forState:UIControlStateNormal];
}
-(void)setMBgImage:(UIImage *)mBgImage{
    _mBgImage = mBgImage;
    [mBgImageView setImage:mBgImage];
}
-(void)setMMoreImage:(UIImage *)mMoreImage{
    _mMoreImage = mMoreImage;
    [mMoreBtn setImage:mMoreImage forState:UIControlStateNormal];
}
-(void)onclickBackBtn:(UIButton *)sender{
    if (self.onclickBackBtn) {
        self.onclickBackBtn(sender);
    }
}
-(void)onclickMoreBtn:(UIButton *)sender{
    if (self.onclickMoreBtn) {
        self.onclickMoreBtn(sender);
    }
}
@end
