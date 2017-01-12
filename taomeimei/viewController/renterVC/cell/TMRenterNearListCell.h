//
//  TMRenterNearListCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/12.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"

@interface TMRenterNearListCell : TMTableViewCell
@property(nonatomic,retain)NSString *mName;
@property(nonatomic,retain)NSString *mSignature;
@property(nonatomic,retain)NSString *mPrice;
@property(nonatomic,retain)NSString *mProfession;
@property(nonatomic,retain)NSString *mArea;
@property(nonatomic,retain)UIImage  *mImage;
@property(nonatomic,assign)BOOL isVip;
@end
