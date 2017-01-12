//
//  TMMInfoCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMMInfoCell.h"

@implementation TMMInfoCell{
    UILabel *mTitlLabel;
    UILabel *mSubLabel;
    UIImageView *markImageView;
        UIView *mLineView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        mTitlLabel = [[UILabel alloc]init];
        [mTitlLabel setTextColor:[UIColor colorWithHexString:@"585858"]];
        [mTitlLabel setFont:DEFAULT_FONT(13)];
        [self.contentView addSubview:mTitlLabel];
        [mTitlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        
        markImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:markImageView];
        [markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(mTitlLabel.mas_right).with.offset(3);
        }];
  
        mSubLabel = [[UILabel alloc]init];
        [mSubLabel setTextColor:[UIColor colorWithHexString:@"585858"]];
        [mSubLabel setFont:DEFAULT_FONT(13)];
        [self.contentView addSubview:mSubLabel];
        [mSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
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

-(void)setMTitleStr:(NSString *)mTitleStr{
    _mTitleStr = mTitleStr;
    [mTitlLabel setText:mTitleStr];
}
-(void)setMSubStr:(NSString *)mSubStr{
    _mSubStr = mSubStr;
    [mSubLabel setText:mSubStr];
}
-(void)setMarkImage:(UIImage *)markImage{
    _markImage = markImage;
    [markImageView setImage:markImage];
}
@end
