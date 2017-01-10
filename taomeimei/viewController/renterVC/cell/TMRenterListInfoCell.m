//
//  TMRenterInfoCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterListInfoCell.h"

@implementation TMRenterListInfoCell{
    UILabel *mNameLable;
    UILabel *mSignatureLable;
    UILabel *mPriceLable;
    UILabel *mProfessionLable;
    UILabel *mAreaLable;
    UILabel *mMarkRenterLable;
    UIImageView  *mImageView;
    UIImageView *mMarkPriceImageView;
    UIImageView *mSexImageView;
    
    UIButton *mCollectBtn;
    UIView *mLineView;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        mNameLable = [[UILabel alloc]init];
        [mNameLable setFont:DEFAULT_BOLD_FONT(15)];
        [mNameLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mNameLable];
        [mNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(22);
            make.height.mas_equalTo(15);
        }];
        
        mSexImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tm_sex"]];
        [mSexImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mSexImageView];
        [mSexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_right).with.offset(5);
            make.bottom.equalTo(mNameLable.mas_bottom);
        }];
        
        mSignatureLable = [[UILabel alloc]init];
        [mSignatureLable setFont:DEFAULT_FONT(12)];
        [mSignatureLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mSignatureLable];
        [mSignatureLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_left);
            make.top.equalTo(mNameLable.mas_bottom).with.offset(9);
            make.height.mas_equalTo(15);
        }];
        
        mPriceLable = [[UILabel alloc]init];
        [mPriceLable setFont:DEFAULT_FONT(15)];
        [mPriceLable setTextColor:[UIColor blackColor]];
        [self addSubview:mPriceLable];
        [mPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(mNameLable.mas_bottom);
        }];
        
        mMarkPriceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tm_price"]];
        [mMarkPriceImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mMarkPriceImageView];
        [mMarkPriceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mPriceLable.mas_left).with.offset(-2);
            make.centerY.equalTo(mPriceLable.mas_centerY);
        }];
        
        mImageView = [[UIImageView alloc]init];
        [mImageView setContentMode:UIViewContentModeScaleAspectFill];
        [mImageView.layer setMasksToBounds:YES];
        [self.contentView addSubview:mImageView];
        [mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(mSignatureLable.mas_bottom).with.offset(17);
            make.height.mas_equalTo(267);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
         
        }];
        
        mCollectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mCollectBtn setImage:[UIImage imageNamed:@"tm_btn_collect"] forState:UIControlStateNormal];
        [self.contentView addSubview:mCollectBtn];
        [mCollectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.centerY.equalTo(mImageView.mas_bottom);
        }];
        
        mAreaLable = [[UILabel alloc]init];
        [mAreaLable setFont:DEFAULT_BOLD_FONT(14)];
        [mAreaLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mAreaLable];
        [mAreaLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mNameLable.mas_left);
            make.top.equalTo(mImageView.mas_bottom).with.offset(20);
            make.height.mas_equalTo(22);
        }];
        
        mProfessionLable = [[UILabel alloc]init];
        [mProfessionLable setFont:DEFAULT_FONT(13)];
        [mProfessionLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mProfessionLable];
        [mProfessionLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mAreaLable.mas_right).with.offset(20);
            make.top.equalTo(mAreaLable.mas_top);
            make.height.mas_equalTo(22);

        }];

        mLineView = [UIView new];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
        [self.contentView addSubview:mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(mAreaLable.mas_bottom).with.offset(16);
            make.height.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
        }];
        
        mMarkRenterLable = [[UILabel alloc]init];
        [mMarkRenterLable setText:@"租TA"];
         [mPriceLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [mMarkRenterLable setFont:DEFAULT_FONT(12)];
        [self.contentView addSubview:mMarkRenterLable];
        [mMarkRenterLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(mCollectBtn.mas_centerX);
            make.centerY.equalTo(mAreaLable.mas_centerY);
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
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
