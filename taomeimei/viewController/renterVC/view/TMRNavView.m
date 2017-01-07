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

}
-(instancetype)init{
    self = [super init];
    if (self) {
        mBGImageView = [[UIImageView alloc]init];
        [self addSubview:mBGImageView];
        [mBGImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
        UICollectionViewFlowLayout *mLayout = [[UICollectionViewFlowLayout alloc]init];
       // mLayout.itemSize = CGSizeMake(viewWidth/4, 36);
        mLayout.minimumInteritemSpacing = 0;
        mLayout.minimumLineSpacing = 0; //上下的间距 可以设置0看下效果
       // mLayout.sectionInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f);
        mLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        mInfoCollectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:mLayout];
        mInfoCollectView.showsVerticalScrollIndicator = NO;
        mInfoCollectView.showsHorizontalScrollIndicator = NO;
        [mInfoCollectView setBackgroundColor:[UIColor clearColor]];
        mInfoCollectView.delegate = self;
        mInfoCollectView.dataSource = self;
        [mInfoCollectView registerClass:[TMCollectionViewCell class] forCellWithReuseIdentifier:@"TMNavMenuCell"];
        [self addSubview:mInfoCollectView];
        [mInfoCollectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_centerY);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return self;
}
#pragma mark setter
-(void)setMBgImage:(UIImage *)mBgImage{
    _mBgImage = mBgImage;
    [mBGImageView setImage:mBgImage];
}
#pragma mark - CollectionViewDataSoure
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TMNavMenuCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TMNavMenuCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@(indexPath.row).description);
}

#pragma mark -- UICollectionViewDelegate
//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(MainScreenFrame_Width/4, collectionView.frame.size.height);
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
