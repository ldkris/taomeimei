//
//  TMRenterHeaderCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"

@interface TMRenterHeaderCell : TMTableViewCell
@property(nonatomic,retain)NSArray *mPhotos;
@property(nonatomic,copy)void(^didTapAtIndex)(NSInteger index);
@end
