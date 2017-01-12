//
//  TMRenterNearListCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/12.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterNearListCell.h"

@interface TMRenterNearListCell ()


@end

@implementation TMRenterNearListCell{

    UILabel *mNameLable;
    UILabel *mSignatureLable;
    UILabel *mPriceLable;
    UILabel *mProfessionLable;
    UILabel *mAreaLable;
    UILabel *mMarkRenterLable;
    UIImageView  *mImageView;
    UIImageView *mMarkPriceImageView;
    UIImageView *mMarkDisImageView;
    UIImageView *mIsVipImageView;
    UIImageView *mSexImageView;;
    UIView *mLineView;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        mLineView = [UIView new];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
        [self.contentView addSubview:mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
        }];
        
        mImageView = [[UIImageView alloc]init];
        [mImageView setContentMode:UIViewContentModeScaleAspectFill];
        [mImageView.layer setMasksToBounds:YES];
        [self.contentView addSubview:mImageView];
        [mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.height.width.mas_equalTo(105);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-20);
        }];
        
        mSignatureLable = [[UILabel alloc]init];
        [mSignatureLable setFont:DEFAULT_FONT(12)];
        [mSignatureLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mSignatureLable];
        [mSignatureLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mImageView.mas_right).with.offset(15);
            make.centerY.equalTo(mImageView.mas_centerY);
        }];
        
        mNameLable = [[UILabel alloc]init];
        [mNameLable setFont:DEFAULT_BOLD_FONT(15)];
        [mNameLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mNameLable];
        [mNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSignatureLable.mas_left);
            make.bottom.equalTo(mSignatureLable.mas_top).with.offset(-5);
        }];
        
        mSexImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tm_sex"]];
        [mSexImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mSexImageView];
        [mSexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_right).with.offset(5);
            make.bottom.equalTo(mNameLable.mas_bottom).with.offset(-1);
        }];
        
        mIsVipImageView = [[UIImageView alloc]init];
        [mIsVipImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mIsVipImageView];
        [mIsVipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSexImageView.mas_right).with.offset(10);
            make.bottom.equalTo(mSexImageView.mas_bottom).with.offset(-1);
        }];
    
        mProfessionLable = [[UILabel alloc]init];
        [mProfessionLable setFont:DEFAULT_FONT(13)];
        [mProfessionLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mProfessionLable];
        [mProfessionLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSignatureLable.mas_left);
            make.top.equalTo(mSignatureLable.mas_bottom).with.offset(30);
        }];
       
        mPriceLable = [[UILabel alloc]init];
        [mPriceLable setFont:DEFAULT_FONT(14)];
        [mPriceLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self addSubview:mPriceLable];
        [mPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.equalTo(mProfessionLable.mas_bottom);
        }];

       mMarkPriceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tmd_price"]];
        [mMarkPriceImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mMarkPriceImageView];
        [mMarkPriceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mPriceLable.mas_left).with.offset(-2);
            make.centerY.equalTo(mPriceLable.mas_centerY);
        }];

        mAreaLable = [[UILabel alloc]init];
        [mAreaLable setFont:DEFAULT_FONT(13)];
        [mAreaLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mAreaLable];
        [mAreaLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.equalTo(mNameLable.mas_bottom);
        }];
        
        mMarkDisImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tmd_dis_mark"]];
        [mMarkDisImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mMarkDisImageView];
        [mMarkDisImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mAreaLable.mas_left).with.offset(-2);
            make.bottom.equalTo(mAreaLable.mas_bottom);
        }];
    }
    return self;
}
-(void)setMName:(NSString *)mName{
    _mName = mName;
    [mNameLable setText:mName];
}
-(void)setMSignature:(NSString *)mSignature{
    _mSignature = mSignature;
    [mSignatureLable setText:mSignature];
}
-(void)setMPrice:(NSString *)mPrice{
    _mPrice = mPrice;
    [mPriceLable setText:mPrice];
}
-(void)setMArea:(NSString *)mArea{
    _mArea = mArea;
    [mAreaLable setText:mArea];
}
-(void)setMImage:(UIImage *)mImage{
    _mImage = mImage;
    [mImageView setImage:mImage];
}
-(void)setMProfession:(NSString *)mProfession{
    _mProfession = mProfession;
    [mProfessionLable setText:mProfession];
}
-(void)setIsVip:(BOOL)isVip{
    _isVip = isVip;
    if (isVip) {
        [mIsVipImageView setImage:[UIImage imageNamed:@"tm_markVip"]];
    }else{
        [mIsVipImageView setImage:nil];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
