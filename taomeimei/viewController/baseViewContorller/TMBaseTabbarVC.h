//
//  TMBaseTabbarVC.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/3.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBaseTabbarVC : UITabBarController
@property(nonatomic,retain)UIView *mBarView;
-(void)selectVCWithIndex:(NSInteger)index;
@property(nonatomic,retain) NSArray *barImages;
@property(nonatomic,retain) NSArray *barSelectImages;
@end
