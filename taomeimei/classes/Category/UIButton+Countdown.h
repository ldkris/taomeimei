//
//  UIButton+Countdown.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/3.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Countdown)
-(void)CountdownWithSeconds:(int)second description:(NSString *)des compleBlock:(void(^)())block;
@end
