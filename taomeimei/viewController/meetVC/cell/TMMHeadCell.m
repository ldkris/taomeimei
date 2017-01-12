//
//  TMMHeadCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMMHeadCell.h"

@implementation TMMHeadCell{
    UILabel *mNameLable;
    UILabel *mSignatureLable;
    UIImageView *mSexImageView;
    UIImageView *mHeadImageView;
    UIView *mLineView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        mHeadImageView = [[UIImageView alloc]init];
        [mHeadImageView.layer setMasksToBounds:YES];
        [mHeadImageView.layer setCornerRadius:25];
        [mHeadImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mHeadImageView];
        [mHeadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.height.width.mas_equalTo(50);
            make.bottom.mas_equalTo(-10);
        }];
        
        mNameLable = [[UILabel alloc]init];
        [mNameLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [mNameLable setFont:DEFAULT_BOLD_FONT(15)];
        [self.contentView addSubview:mNameLable];
        [mNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(mHeadImageView.mas_centerY);
            make.left.equalTo(mHeadImageView.mas_right).with.offset(10);
        }];
        
        mSexImageView = [[UIImageView alloc]init];
        [mSexImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mSexImageView];
        [mSexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_right).with.offset(3);
            make.bottom.equalTo(mNameLable.mas_bottom);
        }];
        
        mSignatureLable = [[UILabel alloc]init];
        [mSignatureLable setFont:DEFAULT_FONT(12)];
        [mSignatureLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mSignatureLable];
        [mSignatureLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_left);
            make.top.equalTo(mNameLable.mas_bottom).with.offset(2);
        }];
        
        mLineView = [UIView new];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
        [self.contentView addSubview:mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(0);
        }];
        
    }
    return self;
}

-(void)setMName:(NSString *)mName{
    _mName = mName;
    [mNameLable setText:mName];
}
-(void)setIsMan:(BOOL)isMan{
    _isMan = isMan;
    if (isMan) {
        [mSexImageView setImage:[UIImage imageNamed:@"tm_sex"]];
    }else{
        [mSexImageView setImage:[UIImage imageNamed:@"tm_sex"]];
    }
}
-(void)setMSignature:(NSString *)mSignature{
    _mSignature = mSignature;
    [mSignatureLable setText:mSignature];
}
-(void)setMHeadImage:(UIImage *)mHeadImage{
    _mHeadImage = mHeadImage;
    [mHeadImageView setImage:mHeadImage];
}
@end
