//
//  TMNavMenuCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMCollectionViewCell.h"

@interface TMNavMenuCell : TMCollectionViewCell
@property(nonatomic,retain)UIImage *mItemBgImage;
@property(nonatomic,retain)NSString *mItemTitle;
@property(nonatomic,assign)BOOL mIsSelected;
@end
