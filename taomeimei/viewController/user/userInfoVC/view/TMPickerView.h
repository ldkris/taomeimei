//
//  TMPickerView.h
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  TMPickerViewDelegate<NSObject>
-(void)getPickerViewValue:(NSString *)values;//获取颜色改变的代理方法
@end
@interface TMPickerView : UIView
//委托变量
@property(nonatomic,weak) id<TMPickerViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame;
+(instancetype)makeViewWithMaskDatePicker:(CGRect)frame setTitle:(NSString *)title Arr:(NSArray *)arr;

@end
