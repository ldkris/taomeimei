//
//  TMRenterVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterVC.h"
#import "TMRNavView.h"
@interface TMRenterVC ()

@end

@implementation TMRenterVC{
    TMRNavView *mNavView;
    UITableView *mInfoTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mNavView = [[TMRNavView alloc]init];
    [mNavView setMBgImage:[UIImage imageNamed:@"tm_nav_bg"]];
    [self.view addSubview:mNavView];
    
    mInfoTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    mInfoTableView.rowHeight = UITableViewAutomaticDimension;
    mInfoTableView.estimatedRowHeight = 100;
    mInfoTableView.tableFooterView = [UIView new];
    [mInfoTableView  setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:mInfoTableView];
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
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
