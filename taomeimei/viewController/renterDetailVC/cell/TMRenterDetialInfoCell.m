//
//  TMRenterDetialInfoCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterDetialInfoCell.h"

@implementation TMRenterDetialInfoCell{
    UILabel *mSignatureLable;
    UILabel *mPriceLable;
    UILabel *mProfessionLable;
    UILabel *mAreaLable;
    UIImageView *mMarkPriceImageView;
    UILabel *mHeightLable;
    UILabel *mAgeLable;
    UIImageView *mMarDisImageView;
    UILabel *mDistanceLable;
    UIView *mLineView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        mSignatureLable = [[UILabel alloc]init];
        [mSignatureLable setFont:DEFAULT_FONT(14)];
        [mSignatureLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mSignatureLable];
        [mSignatureLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(19);
            make.height.mas_equalTo(15);
        }];
        
        mPriceLable = [[UILabel alloc]init];
        [mPriceLable setFont:DEFAULT_FONT(16)];
        [mPriceLable setTextColor:[UIColor blackColor]];
        [self addSubview:mPriceLable];
        [mPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottom.equalTo(mSignatureLable.mas_bottom);
        }];
        
        mMarkPriceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tmd_price"]];
        [mMarkPriceImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mMarkPriceImageView];
        [mMarkPriceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mPriceLable.mas_left).with.offset(-2);
            make.centerY.equalTo(mPriceLable.mas_centerY);
        }];

        mAreaLable = [[UILabel alloc]init];
        [mAreaLable setFont:DEFAULT_FONT(14)];
        [mAreaLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mAreaLable];
        [mAreaLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSignatureLable.mas_left);
            make.top.equalTo(mSignatureLable.mas_bottom).with.offset(11);
            make.height.mas_equalTo(22);
        }];
        
        mMarDisImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tmd_dis_mark"]];
        [mMarDisImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:mMarDisImageView];
        [mMarDisImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mAreaLable.mas_right).with.offset(17);
            make.centerY.equalTo(mAreaLable.mas_centerY);
        }];
        
        mDistanceLable = [[UILabel alloc]init];
        [mDistanceLable setFont:DEFAULT_FONT(14)];
        [mDistanceLable setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mDistanceLable];
        [mDistanceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mMarDisImageView.mas_right).with.offset(2);
            make.centerY.equalTo(mAreaLable.mas_centerY);
        }];
        
        mHeightLable = [[UILabel alloc]init];
        [mHeightLable setFont:DEFAULT_FONT(14)];
        [mHeightLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mHeightLable];
        [mHeightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSignatureLable.mas_left);
            make.top.equalTo(mAreaLable.mas_bottom).with.offset(32);
            make.height.mas_equalTo(22);
        }];
        
        mHeightLable = [[UILabel alloc]init];
        [mHeightLable setFont:DEFAULT_FONT(14)];
        [mHeightLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mHeightLable];
        [mHeightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mSignatureLable.mas_left);
            make.top.equalTo(mAreaLable.mas_bottom).with.offset(32);
            make.height.mas_equalTo(22);
        }];

        mAgeLable = [[UILabel alloc]init];
        [mAgeLable setFont:DEFAULT_FONT(14)];
        [mAgeLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [self.contentView addSubview:mAgeLable];
        [mAgeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(mHeightLable.mas_centerY);
            make.left.equalTo(mHeightLable.mas_right).with.offset(30);
        }];
        
        mLineView = [UIView new];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
        [self.contentView addSubview:mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(mHeightLable   .mas_bottom).with.offset(21);
            make.height.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

-(void)setMSignature:(NSString *)mSignature{
    _mSignature = mSignature;
    // 创建对象.
    mSignatureLable.text = mSignature;
}
-(void)setMPrice:(NSString *)mPrice{
    _mPrice = mPrice;
    [mPriceLable setText:mPrice];
}
-(void)setMArea:(NSString *)mArea{
    _mArea = mArea;
    [mAreaLable setText:mArea];
}
-(void)setMHeight:(NSString *)mHeight{
    _mHeight = mHeight;
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:mHeight];
    [mAttStri addAttribute:NSForegroundColorAttributeName value:[UIColor  colorWithHexString:@"585858"] range:NSMakeRange(0, 2)];
    mHeightLable.attributedText = mAttStri;
}
-(void)setMAge:(NSString *)mAge{
    _mAge = mAge;
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:mAge];
    [mAttStri addAttribute:NSForegroundColorAttributeName value:[UIColor  colorWithHexString:@"585858"] range:NSMakeRange(0, 2)];
    mAgeLable.attributedText = mAttStri;
}
-(void)setMProfession:(NSString *)mProfession{
    _mProfession = mProfession;
    NSMutableAttributedString *mAttStri = [[NSMutableAttributedString alloc] initWithString:mProfession];
    [mAttStri addAttribute:NSForegroundColorAttributeName value:[UIColor  colorWithHexString:@"585858"] range:NSMakeRange(0, 2)];
    mProfessionLable.attributedText = mAttStri;
}
-(void)setMDistance:(NSString *)mDistance{
    _mDistance = mDistance;
    [mDistanceLable setText:mDistance];
}
@end
