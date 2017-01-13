//
//  TMAdvertisementVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/3.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMAdvertisementVC.h"
#import "UIButton+Countdown.h"
#import "TMBaseTabbarVC.h"
#import "TMGuideVC.h"
#import "TMNavigationController.h"
#import "loginVC.h"
#import "TMUserCenterVC.h"
#import "TMRenterVC.h"
#import "TMChatListVC.h"
@interface TMAdvertisementVC ()
@property(nonatomic,strong)UIImageView *mBgView;
@property(nonatomic,strong)UIButton *mTGBtn;
@end

@implementation TMAdvertisementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    self.mBgView = [[UIImageView alloc]init];
    [self.mBgView setImage:[UIImage imageNamed:@"tm_ad.png"]];
    [self.view addSubview:self.mBgView];
    
    self.mTGBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.mTGBtn setTitle:@"跳过3" forState:UIControlStateNormal];
    [self.mTGBtn CountdownWithSeconds:3 description:@"跳过" compleBlock:^{
        LDLOG(@"完成");
        [self onclickTGBtn:nil];
    }];
    [self.mTGBtn setBackgroundImage:[UIImage imageNamed:@"ad_btn_bg"] forState:UIControlStateNormal];
    [self.mTGBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.mTGBtn.titleLabel setFont:DEFAULT_FONT(13)];
    [self.mTGBtn addTarget:self action:@selector(onclickTGBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mTGBtn];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
    }];
    
    [self.mTGBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(13);
        make.right.mas_equalTo(-13);
    }];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark event response
-(void)onclickTGBtn:(UIButton *)sender{
    
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"isGuide"]) {
        TMGuideVC *mGuideVc = [[TMGuideVC alloc]init];
        mGuideVc.mGuideImages = @[@"tm_guide1",@"tm_guide2",@"tm_guide3"];
        [mGuideVc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:mGuideVc animated:YES completion:nil];
        return;
    }
    
    
    TMRenterVC *mRenterVC  = [[TMRenterVC alloc]init];
    TMNavigationController *mRenterNavVC = [[TMNavigationController alloc]initWithRootViewController:mRenterVC];
    
    TMUserCenterVC *userCenterVC = [[TMUserCenterVC alloc] initWithNibName:@"TMUserCenterVC" bundle:nil];
    TMNavigationController *userCenterNavVC = [[TMNavigationController alloc] initWithRootViewController:userCenterVC];
    
    TMChatListVC *mChatListVC  = [[TMChatListVC alloc]init];
    TMNavigationController *mChatListNavVC = [[TMNavigationController alloc]initWithRootViewController:mChatListVC];
    
    UIViewController *mRenterVC2  = [[UIViewController alloc]init];
    TMNavigationController *mRenterNavVC2 = [[TMNavigationController alloc]initWithRootViewController:mRenterVC2];
    
    UIViewController *mRenterVC3  = [[UIViewController alloc]init];
    TMNavigationController *mRenterNavVC3 = [[TMNavigationController alloc]initWithRootViewController:mRenterVC3];
    
    TMBaseTabbarVC *mTabVC = [[TMBaseTabbarVC alloc]init];
    [mTabVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [mTabVC setViewControllers:@[mRenterNavVC,mRenterNavVC2,mRenterNavVC3,mChatListNavVC,userCenterNavVC]];
    [self presentViewController:mTabVC animated:YES completion:nil];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        loginVC *mGuideVc = [[loginVC alloc]init];
    //       TMNavigationController *mNav = [[TMNavigationController alloc]initWithRootViewController:mGuideVc];
    //       [mGuideVc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    //       [mTabVC presentViewController:mNav animated:YES completion:nil];
    //   });
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
