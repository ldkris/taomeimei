//
//  TMTransparencyNavBarView.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMTransparencyNavBarView : UIView
@property(nonatomic,retain)NSString *mTitle;
@property(nonatomic,retain)UIImage *mBackBarImage;
@property(nonatomic,retain)UIImage *mBgImage;
@property(nonatomic,retain)UIImage *mMoreImage;
@property(nonatomic,copy)void(^onclickBackBtn)(UIButton *sender);
@property(nonatomic,copy)void(^onclickMoreBtn)(UIButton *sender);

@end
