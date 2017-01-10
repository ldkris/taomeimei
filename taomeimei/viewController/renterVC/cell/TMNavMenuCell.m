//
//  TMNavMenuCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMNavMenuCell.h"

@implementation TMNavMenuCell{
    UIImageView *mItemBgImageView;
    UILabel *mmItemTitleLable;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        mItemBgImageView = [[UIImageView alloc]init];
        mItemBgImageView.layer.masksToBounds = YES;
        [mItemBgImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:mItemBgImageView];
        [mItemBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        mmItemTitleLable = [[UILabel alloc]init];
        [mmItemTitleLable setFont:DEFAULT_FONT(14)];
        [mmItemTitleLable setTextColor:[UIColor colorWithHexString:@"ffaec1"]];
        [self addSubview:mmItemTitleLable];
        [mmItemTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
    }
    
    return self;
}

-(void)setMItemBgImage:(UIImage *)mItemBgImage{
    _mItemBgImage = mItemBgImage;
    [mItemBgImageView setImage:_mItemBgImage];
}

-(void)setMItemTitle:(NSString *)mItemTitle{
    _mItemTitle = mItemTitle;
    [mmItemTitleLable setText:_mItemTitle];
}
-(void)setMIsSelected:(BOOL)mIsSelected{
    _mIsSelected = mIsSelected;
    if (!_mIsSelected) {
        [mmItemTitleLable setTextColor:[UIColor whiteColor]];
        [mItemBgImageView setImage:nil];
        
    }else{
        [mmItemTitleLable setTextColor:[UIColor colorWithHexString:@"ffaec1"]];
        [mItemBgImageView setImage:self.mItemBgImage];
    }
}
@end
