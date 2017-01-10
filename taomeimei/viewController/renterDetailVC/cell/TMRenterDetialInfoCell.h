//
//  TMRenterDetialInfoCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"
@interface TMRenterDetialInfoCell : TMTableViewCell
/**
签名
 */
@property(nonatomic,retain)NSString *mSignature;
/**
 价格
 */
@property(nonatomic,retain)NSString *mPrice;
/**
 职业
 */
@property(nonatomic,retain)NSString *mProfession;
/**
 地区
 */
@property(nonatomic,retain)NSString *mArea;
/**
 身高
 */
@property(nonatomic,retain)NSString *mHeight;
/**
 年龄
 */
@property(nonatomic,retain)NSString *mAge;
/**
 距离
 */
@property(nonatomic,retain)NSString *mDistance;
@end
