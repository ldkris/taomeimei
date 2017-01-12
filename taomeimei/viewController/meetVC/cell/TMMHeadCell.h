//
//  TMMHeadCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"

@interface TMMHeadCell : TMTableViewCell
/**
 名字
 */
@property(nonatomic,retain)NSString *mName;

/**
 签名
 */
@property(nonatomic,retain)NSString *mSignature;

/**
 性别
 */
@property(nonatomic,assign)BOOL isMan;

/**
 头像
 */
@property(nonatomic,retain)UIImage *mHeadImage;
@end
