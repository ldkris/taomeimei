//
//  TMRegisterInputView.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/5.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMRegisterInputView : UIView{
    UIImageView *mImageView;
    UITextField *mTextField;
    UIView *mLineView;
    UIButton *mCodeBtn;
}
@property(nonatomic,retain)UIImage *image;
@property(nonatomic,retain)NSString *placeholder;
@property(nonatomic,assign)BOOL isPassword;
@property(nonatomic,assign)BOOL isCode;
@property(nonatomic,retain)NSString *resultStr;

@property(nonatomic,copy)void(^onclickGetCodeBtnBlock)(UIButton *sender);
-(void)onclickGetCodeBtnWithBlock:(void(^)(UIButton *sender))block;
@end
