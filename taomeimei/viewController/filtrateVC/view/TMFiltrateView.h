//
//  TMFiltrateView.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMFiltrateView : UIView
@property(nonatomic,assign)int mSliderMax;
@property(nonatomic,assign)int mSliderMin;
@property(nonatomic,retain)NSString *mTitleStr;
@property(nonatomic,assign)int mValue;
@end
