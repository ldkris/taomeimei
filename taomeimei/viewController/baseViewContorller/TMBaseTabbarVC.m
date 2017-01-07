//
//  TMBaseTabbarVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/3.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMBaseTabbarVC.h"

@interface TMBaseTabbarVC ()
@property(nonatomic,retain)NSMutableArray *mBtns;
@end

@implementation TMBaseTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.barImages = @[@"tab_zt",@"tab_zb",@"tab_fx",@"tab_xx",@"tab_wd"];
    self.barSelectImages =  @[@"tab_zt_selected",@"tab_zb",@"tab_fx",@"tab_xx_selected",@"tab_wd_selected"];
    
    [self creatCustomTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)mBtns{
    if(_mBtns == nil){
        _mBtns = [NSMutableArray array];
    }
    return _mBtns;
}
-(void)creatCustomTabBar{
    self.tabBar.hidden = YES;
    
    if (self.mBarView == nil) {
        self.mBarView = [[UIView alloc]init];
        [self.mBarView setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:.8f]];
    }
    [self.view addSubview:self.mBarView];
    [self.mBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(self.tabBar.frame.size.height);
    }];
    
    UIButton *mOldBarBtn;
    for (int i =0; i<self.barImages.count; i++) {
        UIButton *mBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [mBarBtn setTag:i];
        [mBarBtn setImage:[UIImage imageNamed:self.barImages[i]] forState:UIControlStateNormal];
        if (i == 0) {
            [mBarBtn setImage:[UIImage imageNamed:self.barSelectImages[i]] forState:UIControlStateNormal];
        }
        [mBarBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [mBarBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [mBarBtn addTarget:self action:@selector(onclickBarBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.mBarView addSubview:mBarBtn];
        [mBarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            if(mOldBarBtn == nil){
                make.left.top.bottom.mas_equalTo(0);
                make.width.mas_equalTo(MainScreenFrame_Width/self.barImages.count);
            }else{
                if (i == 2) {
                    make.bottom.mas_equalTo(4);
                    make.left.equalTo(mOldBarBtn.mas_right);
                    make.width.mas_equalTo(MainScreenFrame_Width/self.barImages.count);
                    make.height.mas_equalTo(60);
                }else{
                    make.top.bottom.mas_equalTo(0);
                    make.left.equalTo(mOldBarBtn.mas_right);
                    make.width.mas_equalTo(MainScreenFrame_Width/self.barImages.count);
                }
            }
        }];
        mOldBarBtn = mBarBtn;
        [self.mBtns addObject:mBarBtn];
    }
}
-(void)onclickBarBtn:(UIButton *)sender{
    for (UIButton *btn in self.mBtns) {
        if(btn == sender){
            [sender setImage:[UIImage imageNamed:self.barSelectImages[sender.tag]] forState:UIControlStateNormal];
        }else{
            [btn setImage:[UIImage imageNamed:self.barImages[btn.tag]] forState:UIControlStateNormal];
        }
    }
    [self setSelectedIndex:sender.tag];
}

-(void)selectVCWithIndex:(NSInteger)index{
    [self setSelectedIndex:index];
    for (UIButton *btn in self.mBtns) {
        if(btn.tag == index){
            [btn setImage:[UIImage imageNamed:self.barSelectImages[index]] forState:UIControlStateNormal];
        }else{
            [btn setImage:[UIImage imageNamed:self.barImages[btn.tag]] forState:UIControlStateNormal];
        }
    }
}

@end
