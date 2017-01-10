//
//  TMRenterOtherCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterOtherCell.h"

@implementation TMRenterOtherCell{
    UIImageView *mImageView;
    UILabel *mTitleLale;
    UILabel *mSubTitleLale;
    UIView *mLineView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        mImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:mImageView];
        [mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        mTitleLale = [[UILabel alloc]init];
        [mTitleLale setFont:DEFAULT_FONT(14)];
        [mTitleLale setTextColor:[UIColor colorWithHexString:@"585858"]];
        [self.contentView addSubview:mTitleLale];
        [mTitleLale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mImageView.mas_right).with.offset(10);
            make.centerY.mas_equalTo(0);
        }];
        mSubTitleLale = [[UILabel alloc]init];
        mSubTitleLale.text = @"查看";
        [mSubTitleLale setFont:DEFAULT_FONT(14)];
        [mSubTitleLale setTextColor:[UIColor colorWithHexString:@"fed756"]];
        [self.contentView addSubview:mSubTitleLale];
        [mSubTitleLale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
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

-(void)setMTitle:(NSString *)mTitle{
    _mTitle = mTitle;
    [mTitleLale setText:mTitle];
}
-(void)setMImage:(UIImage *)mImage{
    _mImage = mImage;
    [mImageView setImage:mImage];
}
@end
