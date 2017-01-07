//
//  TMGuideVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMGuideVC.h"
#import "TMBaseTabbarVC.h"
@interface TMGuideVC ()
@property(nonatomic,retain)UIScrollView *mGuideScrollView;
@end

@implementation TMGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mGuideScrollView = [[UIScrollView alloc]init];
    self.mGuideScrollView.showsVerticalScrollIndicator = NO;
    self.mGuideScrollView.showsHorizontalScrollIndicator = NO;
    self.mGuideScrollView.userInteractionEnabled = YES;
    [self.mGuideScrollView setPagingEnabled:YES];
    [self.view addSubview:self.mGuideScrollView];
    
    [self.mGuideScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.bottom.mas_equalTo(0);
    }];
    
    UIView *container = [[UIView alloc]init];
    [self.mGuideScrollView addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mGuideScrollView);
        make.height.equalTo(self.mGuideScrollView);
    }];
    
    UIView *lastView = nil;
    
    for (int i = 0; i<self.mGuideImages.count; i++) {
        UIImageView *subImageView = [[UIImageView alloc]init];
        [container addSubview:subImageView];
        [subImageView setImage:[UIImage imageNamed:self.mGuideImages[i]]];
        [subImageView setUserInteractionEnabled:YES];
        [subImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(container);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(MainScreenFrame_Width);
            if (lastView == nil ){
                make.left.mas_equalTo(container.mas_left);
            }
            else
            {
                make.left.mas_equalTo(lastView.mas_right);
            }
        }];
        
        lastView = subImageView;
        
        if (i == self.mGuideImages.count - 1) {
            UIButton *mBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [mBtn setImage:[UIImage imageNamed:@"tm_btn_star"] forState:UIControlStateNormal];
            [mBtn addTarget:self action:@selector(onclickStarBtn:) forControlEvents:UIControlEventTouchUpInside];
            [subImageView addSubview:mBtn];
            [mBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(0);
                make.bottom.mas_equalTo(-85);
            }];
        }
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
    }];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark getter
-(NSArray *)mGuideImages{
    if (_mGuideImages == nil) {
        _mGuideImages = [NSArray array];
    }
    return _mGuideImages;
}
#pragma mark event respose
-(void)onclickStarBtn:(UIButton *)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"isGuide" forKey:@"isGuide"];
    
    UIViewController *oneVC  = [[UIViewController alloc]init];
    UIViewController *twoVC  = [[UIViewController alloc]init];
    
    TMBaseTabbarVC *mTabVC = [[TMBaseTabbarVC alloc]init];
    [mTabVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [mTabVC setViewControllers:@[oneVC,twoVC]];
    [self presentViewController:mTabVC animated:YES completion:nil];
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
