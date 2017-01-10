//
//  TMRenterVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterVC.h"
#import "TMRNavView.h"
#import "TMRenterListInfoCell.h"
#import "TMRenterDetailVC.h"
#import "TMFiltrateVC.h"
#import "CityViewController.h"
#import "MKJFirstViewController.h"
@interface TMRenterVC ()

@end

@implementation TMRenterVC{
    TMRNavView *mNavView;
    UITableView *mInfoTableView;
    BOOL isPush;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mNavView = [[TMRNavView alloc]init];
    [mNavView setMItems:@[@"新上架",@"附近",@"高颜值区",@"低价区",@"认证"]];
    [mNavView setMpageSize:5];
    [mNavView setMBgImage:[UIImage imageNamed:@"tm_nav_bg"]];
    __weak __typeof__(self) weakSelf = self;
    [mNavView setDidFiltrateBlcock:^(UIButton *sender) {
       //筛选
        TMFiltrateVC *mFileTrateVC = [[TMFiltrateVC alloc]init];
        [weakSelf.navigationController pushViewController:mFileTrateVC animated:YES];
    }];
    [mNavView setDidSearchBtnBlcock:^(UIButton *sender) {
        //搜索
        MKJFirstViewController *first = [[MKJFirstViewController alloc]init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:first];
       // [weakSelf.navigationController presentViewController:nvc animated:YES completion:nil];
        [weakSelf.navigationController pushViewController:first animated:YES];
    }];
    [mNavView setDidSelectCityBtnBlcock:^(UIButton *sender) {
        //选择城市
        CityViewController *controller = [[CityViewController alloc] init];
        controller.currentCityString = @"重庆";
        controller.selectString = ^(NSString *string){
            //self.cityLabel.text = string;
        };
        [weakSelf presentViewController:controller animated:YES completion:nil];
    }];
    [mNavView setDidSelectItemAtIndexPathBlcock:^(NSIndexPath *index) {
       //选择菜单
        LDLOG(@"%ld",(long)index.row);
    }];
    [self.view addSubview:mNavView];
    
    mInfoTableView =  [self createTableView];
    [self.view addSubview:mInfoTableView];
    
    isPush = YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self unHideZJTbar];    
    [mNavView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(105);
    }];
    [mInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.left.mas_equalTo(0);
        make.top.equalTo(mNavView.mas_bottom);
        if (isPush) {
            make.bottom.mas_equalTo(0);
        } else  {
            make.bottom.mas_equalTo(-50);
        }
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    if (self.navigationController.viewControllers.count>1) {
        isPush = NO;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate && UITableViewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TMRenterListInfoCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"TMRenterListInfoCell"];
    if (!cell) {
        cell = [[TMRenterListInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TMRenterListInfoCell"];
    }
    [cell setMName:@"Mlao_D"];
    [cell setMPrice:@"200/时"];
    [cell setMSignature:@"租个男友回家过年吧！"];
    [cell setMArea:@"重庆"];
    [cell setMProfession:@"自由职业"];
    [cell setMImage:[UIImage imageNamed:@"tm_renter_def"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // [self dismissViewControllerAnimated:YES completion:nil];
    TMRenterDetailVC *mRenterDetailVC = [[TMRenterDetailVC alloc]init];
    [self.navigationController pushViewController:mRenterDetailVC animated:YES];
}
@end
