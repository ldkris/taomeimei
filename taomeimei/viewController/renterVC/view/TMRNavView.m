//
//  TMRNavView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRNavView.h"
#import "TMNavMenuCell.h"
@implementation TMRNavView{

    UIImageView *mBGImageView;
    
    UICollectionView *mInfoCollectView;
    
    UIButton *mSelectCityBtn;
    UIButton *mOtherBtn;
    UIButton *mSearchBtn;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _mpageSize = 5;
        
        self.backgroundColor = [UIColor clearColor];
        
        mBGImageView = [[UIImageView alloc]init];
        [self addSubview:mBGImageView];
        [mBGImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        UICollectionViewFlowLayout *mLayout = [[UICollectionViewFlowLayout alloc]init];
        mLayout.itemSize = CGSizeMake(0, 0);
        mLayout.minimumInteritemSpacing = 0;
        mLayout.minimumLineSpacing = 0;
        //上下的间距 可以设置0看下效果
        mLayout.sectionInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
        mLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        mInfoCollectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:mLayout];
        mInfoCollectView.showsVerticalScrollIndicator = NO;
        mInfoCollectView.showsHorizontalScrollIndicator = NO;
        [mInfoCollectView setBackgroundColor:[UIColor clearColor]];
        mInfoCollectView.delegate = self;
        mInfoCollectView.dataSource = self;
        [mInfoCollectView registerClass:[TMNavMenuCell class] forCellWithReuseIdentifier:@"TMNavMenuCell"];
        [self addSubview:mInfoCollectView];
        [mInfoCollectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(11);
            make.right.mas_equalTo(-11);
            make.bottom.mas_equalTo(-6);
            make.height.mas_equalTo(53/2);
        }];
        
        mSelectCityBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mSelectCityBtn setImage:[UIImage imageNamed:@"tm_btn_selectCity"] forState:UIControlStateNormal];
        [mSelectCityBtn setTitle:@"重庆" forState:UIControlStateNormal];
        [mSelectCityBtn.titleLabel setFont:DEFAULT_FONT(13)];
        [mSelectCityBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        [mSelectCityBtn addTarget:self action:@selector(onclickSelectCityBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mSelectCityBtn];
        [mSelectCityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mInfoCollectView.mas_left);
            make.top.mas_equalTo(37);
            make.width.mas_equalTo(45);
        }];
        
        mOtherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mOtherBtn setImage:[UIImage imageNamed:@"tm_btn_other"] forState:UIControlStateNormal];
        [mOtherBtn.titleLabel setFont:DEFAULT_FONT(13)];
        [mOtherBtn addTarget:self action:@selector(onclickFiltrateBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mOtherBtn];
        [mOtherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mInfoCollectView.mas_right);
            make.top.mas_equalTo(37);
            make.width.mas_equalTo(40);
        }];
        
        mSearchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mSearchBtn setImage:[UIImage imageNamed:@"tm_btn_serch"] forState:UIControlStateNormal];
        [mSearchBtn addTarget:self action:@selector(onclickSerachBtn:) forControlEvents:UIControlEventTouchUpInside];
        [mSearchBtn.titleLabel setFont:DEFAULT_FONT(13)];
        [self addSubview:mSearchBtn];
        [mSearchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(mOtherBtn.mas_left);
            make.top.mas_equalTo(37);
            make.width.mas_equalTo(40);
        }];
    }
    return self;
}
#pragma mark setter
-(void)setMBgImage:(UIImage *)mBgImage{
    _mBgImage = mBgImage;
    [mBGImageView setImage:mBgImage];
}
-(void)setMItems:(NSArray *)mItems{
    _mItems = mItems;
    [mInfoCollectView reloadData];
}
-(void)setMpageSize:(NSInteger)mpageSize{
    _mpageSize = mpageSize;
    [mInfoCollectView reloadData]    ;
}
#pragma mark event response
-(void)onclickSelectCityBtn:(UIButton *)sender{
}
-(void)onclickFiltrateBtn:(UIButton *)sender{
}
-(void)onclickSearchBtn:(UIButton *)sender{
}
#pragma mark - CollectionViewDataSoure
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mItems.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TMNavMenuCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TMNavMenuCell" forIndexPath:indexPath];
    [cell setMItemTitle:self.mItems[indexPath.row]];
    [cell setMItemBgImage: [UIImage imageNamed:@"nav_item_bg"]];
    if (indexPath.row == 0) {
        [cell setMIsSelected:YES];
    }else{
        [cell setMIsSelected:NO];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LDLOG(@"%@",@(indexPath.row).description);
    for (TMNavMenuCell* cell in [collectionView visibleCells]) {
        if (cell == [collectionView cellForItemAtIndexPath:indexPath]) {
            [cell setMIsSelected:YES];
        }else{
            [cell setMIsSelected:NO];
        }
    }
    
    if (self.didSelectItemAtIndexPathBlcock) {
        self.didSelectItemAtIndexPathBlcock(indexPath);
    }
}

#pragma mark  UICollectionViewDelegate
//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.frame.size.width/self.mpageSize, collectionView.frame.size.height);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0,0);
}

//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}
@end
