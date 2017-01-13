//
//  TMRenterHeaderCell.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterHeaderCell.h"
#import <ImagePlayerView.h>
@implementation TMRenterHeaderCell{
    ImagePlayerView *mBGImageView;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        mBGImageView =[[ImagePlayerView alloc] init];
        mBGImageView.scrollInterval = 3.0f;
        // adjust pageControl position
        mBGImageView.pageControlPosition = ICPageControlPosition_BottomRight;
        mBGImageView.hidePageControl = NO;
        mBGImageView.endlessScroll = YES;
        [mBGImageView setImagePlayerViewDelegate:(id)self];
        [mBGImageView.pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
        [mBGImageView.pageControl setPageIndicatorTintColor:[UIColor colorWithHexString:@"fb686e"]];
        [self.contentView addSubview:mBGImageView];
        [mBGImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(325);
        }];
    }
    return self;
}
-(void)setMPhotos:(NSArray *)mPhotos{
    _mPhotos = mPhotos;
    [mBGImageView reloadData];
}

#pragma mark - ImagePlayerViewDelegate
- (NSInteger)numberOfItems
{
    if (self.mPhotos) {
        return self.mPhotos.count;
    }
    
    return 0;
}
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{
    // recommend to use SDWebImage lib to load web image
    [imageView setImage:[UIImage imageNamed:@"tm_renter_def"]];
    [imageView  setContentMode:UIViewContentModeScaleAspectFill];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    if (self.didTapAtIndex) {
        self.didTapAtIndex(index);
    }
}
@end
