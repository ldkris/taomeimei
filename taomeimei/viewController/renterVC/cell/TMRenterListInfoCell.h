//
//  TMRenterInfoCell.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMTableViewCell.h"

@interface TMRenterListInfoCell : TMTableViewCell
@property(nonatomic,retain)NSString *mName;
@property(nonatomic,retain)NSString *mSignature;
@property(nonatomic,retain)NSString *mPrice;
@property(nonatomic,retain)NSString *mProfession;
@property(nonatomic,retain)NSString *mArea;
@property(nonatomic,retain)UIImage  *mImage;
@property(nonatomic,assign)BOOL isVip;
@end
