//
//  TMRenterDetailVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/9.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterDetailVC.h"
#import "TMTransparencyNavBarView.h"
#import "TMRenterHeaderCell.h"
#import "TMRenterDetialInfoCell.h"
#import "TMRenterOtherCell.h"
@interface TMRenterDetailVC ()

@end

@implementation TMRenterDetailVC{
    TMTransparencyNavBarView *mNavBarView;
    UITableView *mInfoTableView;
    UIButton *mChatBtn;
    UIButton *mYueTaBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mInfoTableView = [self createTableView];
    [mInfoTableView setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
    [self.view addSubview:mInfoTableView];
    
    mNavBarView = [[TMTransparencyNavBarView alloc]init];
    [mNavBarView setMTitle:@"刘冬"];
    [mNavBarView setMBackBarImage:[UIImage imageNamed:@"icon_back"]];
    [mNavBarView setMBgImage:[UIImage imageNamed:@"nav_bg"]];
    [mNavBarView setMMoreImage:[UIImage imageNamed:@"tm_nav_more"]];
    __weak typeof(self) weakSelf = self;
    [mNavBarView setOnclickBackBtn:^(UIButton *sender) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [mNavBarView setOnclickMoreBtn:^(UIButton *sender) {
        LDLOG(@"更多");
    }];
    [self.view addSubview:mNavBarView];
 
    mChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [mChatBtn.titleLabel setFont:DEFAULT_FONT(14)];
    [mChatBtn setTitle:@" 先聊一聊" forState:UIControlStateNormal];
    [mChatBtn addTarget:self action:@selector(onclickChatBtn:) forControlEvents:UIControlEventTouchUpInside];
    [mChatBtn setImage:[UIImage imageNamed:@"tm_chat"] forState:UIControlStateNormal];
    [mChatBtn setBackgroundColor:[UIColor whiteColor]];
    [mChatBtn setTitleColor:[UIColor colorWithHexString:@"585858"] forState:UIControlStateNormal];
    [self.view addSubview:mChatBtn];
    
    mYueTaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [mYueTaBtn setTitle:@"约TA" forState:UIControlStateNormal];
    [mYueTaBtn.titleLabel setFont:DEFAULT_FONT(14)];
    [mYueTaBtn addTarget:self action:@selector(onclickYueBtn:) forControlEvents:UIControlEventTouchUpInside];
    [mYueTaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mYueTaBtn setBackgroundColor:[UIColor colorWithHexString:@"ffaec1"]];
    [self.view addSubview:mYueTaBtn];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    [mNavBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    
    [mInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.left.right.mas_equalTo(0);
    }];
    
    [mChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.width.mas_equalTo(MainScreenFrame_Width/3);
    }];
    [mYueTaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.left.equalTo(mChatBtn.mas_right);
    }];

}
-(void)viewWillDisappear:(BOOL)animated{
   // [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark event respose
-(void)onclickChatBtn:(UIButton *)sender{

}
-(void)onclickYueBtn:(UIButton *)sender{
}
#pragma mark UITableViewDelegate && UITableViewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TMRenterHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMRenterHeaderCell"];
        if (cell == nil) {
            cell = [[TMRenterHeaderCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMRenterHeaderCell"];
        }
        return cell;
    }
    if (indexPath.row == 1) {
        TMRenterDetialInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMRenterDetialInfoCell"];
        if (cell == nil) {
            cell = [[TMRenterDetialInfoCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMRenterDetialInfoCell"];
        }
        [cell setMAge:@"年龄 26"];
        [cell setMSignature:@"快过年了，租个男朋友回家过年吧"];
        [cell setMPrice:@"200/时"];
        [cell setMHeight:@"身高 175cm"];
        [cell setMProfession:@"职业 自由职业"];
        [cell setMDistance:@"300米内"];
        [cell setMArea:@"重庆"];
        return cell;
    }
    TMRenterOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMRenterOtherCell"];
    if (cell == nil) {
        cell = [[TMRenterOtherCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMRenterOtherCell"];
    }
    [cell setMTitle:@[@"出租次数",@"微信号"][indexPath.row - 2]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // [self dismissViewControllerAnimated:YES completion:nil];
}

@end
