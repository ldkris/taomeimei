//
//  TMloginInPutView.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMloginInPutView : UIView{
    UIImageView *_mImageView;
    UITextField *_mTextField;
    UIView *_lineView;
}
@property(nonatomic,retain)UIImage *image;
@property(nonatomic,retain)NSString *placeholder;
@property(nonatomic,assign)BOOL isPassword;
@property(nonatomic,retain)NSString *resultStr;
@end
