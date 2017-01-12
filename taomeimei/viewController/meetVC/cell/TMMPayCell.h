//
//  TMMPayCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"

@interface TMMPayCell : TMTableViewCell
@property(nonatomic,retain)NSString *mTitleStr;
@property(nonatomic,retain)UIImage *markImage;
@property(nonatomic,assign)BOOL isSelected;
@end
