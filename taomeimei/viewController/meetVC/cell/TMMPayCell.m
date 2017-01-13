//
//  TMMPayCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMMPayCell.h"

@implementation TMMPayCell{
    UILabel *mTitlLabel;
    UIImageView *markImageView;
    UIImageView *mSelectImageView;
    UIView *mLineView;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        mLineView = [UIView new];
        [mLineView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
        [self.contentView addSubview:mLineView];
        [mLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.bottom.mas_equalTo(0);
        }];
        
        markImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:markImageView];
        [markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        
        mSelectImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:mSelectImageView];
        [mSelectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        
        mTitlLabel = [[UILabel alloc]init];
        [mTitlLabel setTextColor:[UIColor colorWithHexString:@"585858"]];
        [mTitlLabel setFont:DEFAULT_FONT(13)];
        [self.contentView addSubview:mTitlLabel];
        [mTitlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.equalTo(markImageView.mas_right).with.offset(3);
        }];
    }
    return self;
}
-(void)setMTitleStr:(NSString *)mTitleStr{
    _mTitleStr = mTitleStr;
    [mTitlLabel setText:mTitleStr];
}

-(void)setMarkImage:(UIImage *)markImage{
    _markImage = markImage;
    [markImageView setImage:markImage];
}
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        [mSelectImageView setImage:[UIImage imageNamed:@"tmm_selexted"]];
    }else{
        [mSelectImageView setImage:[UIImage imageNamed:@"tmm_selext"]];
    }
}
@end
