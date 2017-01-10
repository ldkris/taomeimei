//
//  TMRNavView.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMRNavView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,retain)UIImage *mBgImage;
@property(nonatomic,retain)NSArray *mItems;
@property(nonatomic,assign)NSInteger mpageSize;

@property(nonatomic,copy)void(^didSelectItemAtIndexPathBlcock)(NSIndexPath *index);
@property(nonatomic,copy)void(^didSearchBtnBlcock)(UIButton *index);
@property(nonatomic,copy)void(^didFiltrateBlcock)(UIButton *index);
@property(nonatomic,copy)void(^didSelectCityBtnBlcock)(UIButton *index);
@end
