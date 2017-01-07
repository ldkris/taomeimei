//
//  TMAgreementVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/5.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMAgreementVC.h"

@interface TMAgreementVC ()
@property(nonatomic,retain)UITextView *mContentTextView;
@property(nonatomic,retain)UIView *mLineView;
@property(nonatomic,retain)UILabel *mAgrermentTitle;
@property(nonatomic,retain)UIImageView *mBgImageView;
@end

@implementation TMAgreementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f2f2f2"]];
    self.title = @"淘美美用户协议";
    
    [self.view addSubview:self.mContentTextView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark getter
-(UILabel *)mAgrermentTitle{
    if (_mAgrermentTitle == nil) {
        _mAgrermentTitle = [[UILabel alloc]init];
        [_mAgrermentTitle setFont:DEFAULT_BOLD_FONT(15)];
        [_mAgrermentTitle setText:@"《淘美美》用户使用协议"];
    }
    return _mAgrermentTitle;
}
-(UIView *)mLineView{
    if (_mLineView == nil) {
        _mLineView = [[UIView alloc]init];
        [_mLineView setBackgroundColor:[UIColor lightGrayColor]];
    }
    return _mLineView;
}
-(UITextView *)mContentTextView{
    if (_mContentTextView == nil) {
        _mContentTextView = [[UITextView alloc]init];
    }
    return _mContentTextView;
}
-(UIImageView *)mBgImageView {
    if (_mBgImageView == nil) {
        _mBgImageView = [[UIImageView alloc]init];
        [_mBgImageView setImage:[UIImage imageNamed:@""]];
    }
    return _mBgImageView;
}
@end
