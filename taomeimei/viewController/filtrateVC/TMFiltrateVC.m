//
//  TMFiltrateVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMFiltrateVC.h"
#import "TMFiltrateView.h"
@interface TMFiltrateVC ()

@end

@implementation TMFiltrateVC{
    UIView *mTopView;
    NSMutableArray *mTopBtns;
    TMFiltrateView *mAageFiletrateView;
    TMFiltrateView *mHeghtFiletrateView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"筛选";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    mTopBtns = [NSMutableArray array];
    
    [self creaTopView];
    [self creatFiltrateView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tmf_right"] style:UIBarButtonItemStylePlain target:self action:@selector(onclickComfirBtn:)];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [mTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    UIButton *mAllBtn = mTopBtns[0];
    UIButton *mManBtn = mTopBtns[1];
    UIButton *mWoManBtn = mTopBtns[2];
    
    [mManBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(-5);
    }];
    
    [mAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.equalTo(mManBtn.mas_left).with.offset(-19);
    }];
    
    [mWoManBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(-5);
        make.left.equalTo(mManBtn.mas_right).with.offset(19);
    }];
    
    [mAageFiletrateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mTopView.mas_bottom).with.offset(10);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    [mHeghtFiletrateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mAageFiletrateView.mas_bottom).with.offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark private
-(void)creaTopView{
    mTopView = [[UIView alloc]init];
    [mTopView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:mTopView];
    
    NSArray *mBtns = @[@"全部",@"男生",@"女生"];
    for (NSString *titleStr in mBtns) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titleStr forState:UIControlStateNormal];
        [btn.titleLabel setFont:DEFAULT_FONT(14)];
      //  [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithHexString:@"585858"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tmf_topSelected"] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"tmf_topSelect"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onclickTopMenuBtn:) forControlEvents:UIControlEventTouchUpInside];
        if ([mBtns indexOfObject:titleStr] == 0) {
            btn.selected = YES;
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(-8, 0, 0, 0)];
        }else{
            btn.selected = NO;
        }
        [mTopView addSubview:btn];
        [mTopBtns addObject:btn];
    }
}
-(void)creatFiltrateView{
    mAageFiletrateView = [[TMFiltrateView alloc]init];
    [mAageFiletrateView setMSliderMin:18];
    [mAageFiletrateView setMSliderMax:60];
    [mAageFiletrateView setMValue:18];
    [mAageFiletrateView setMTitleStr:@"年龄"];
    [self.view addSubview:mAageFiletrateView];
    
    mHeghtFiletrateView = [[TMFiltrateView alloc]init];
    [mHeghtFiletrateView setMSliderMin:150];
    [mHeghtFiletrateView setMSliderMax:220];
    [mHeghtFiletrateView setMValue:150];
    [mHeghtFiletrateView setMTitleStr:@"身高"];
    [self.view addSubview:mHeghtFiletrateView];
}
#pragma mark event respose
-(void)onclickTopMenuBtn:(UIButton *)sender{
    sender.selected = YES;
    for (UIButton *btn in mTopBtns) {
        if (btn !=sender) {
            btn.selected = NO;
        }
        if (btn.selected) {
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(-8, 0, 0, 0)];
            [btn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
            }];
        }else{
             [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
            [btn mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(-5);
            }];
        }
    }
}
-(void)onclickComfirBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
