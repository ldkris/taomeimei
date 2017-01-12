//
//  meetVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMMeetVC.h"
#import "TMMHeadCell.h"
#import "TMMInfoCell.h"
#import "TMMPayCell.h"
#import "TMDatePickView.h"
#import "TMDataPickerView.h"
#import "TMSelectMapPointVC.h"
@interface TMMeetVC (){
    UITableView *mInfoTableView;
    UIView *mtotalView;
    UIButton *mYueTaBtn;
    UILabel *mTolMarkLable;
    UILabel *mTolPriceMarkLable;
}

@end

@implementation TMMeetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"预约";
    
    mInfoTableView = [self createGourpTableView];
    [self.view addSubview:mInfoTableView];
    
    mtotalView = [[UIView alloc]init];
    [mtotalView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:mtotalView];

    
    mYueTaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [mYueTaBtn setTitle:@"马上租TA" forState:UIControlStateNormal];
    [mYueTaBtn.titleLabel setFont:DEFAULT_FONT(14)];
    [mYueTaBtn addTarget:self action:@selector(onclickYueBtn:) forControlEvents:UIControlEventTouchUpInside];
    [mYueTaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mYueTaBtn setBackgroundColor:[UIColor colorWithHexString:@"fb686e"]];
    [self.view addSubview:mYueTaBtn];
    
    mTolMarkLable = [[UILabel alloc]init];
    [mTolMarkLable setFont:DEFAULT_FONT(11)];
    [mTolMarkLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
    [mTolMarkLable setText:@"总计"];
    [mtotalView addSubview:mTolMarkLable];
    
    mTolPriceMarkLable = [[UILabel alloc]init];
    [mTolPriceMarkLable setFont:DEFAULT_FONT(15)];
    [mTolPriceMarkLable setTextColor:[UIColor colorWithHexString:@"fb686e"]];
    [mTolPriceMarkLable setText:@"¥111"];
    [mtotalView addSubview:mTolPriceMarkLable];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    [mInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    
    [mtotalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.width.mas_equalTo(MainScreenFrame_Width/3);
    }];
    
    [mYueTaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(55);
        make.left.equalTo(mtotalView.mas_right);
    }];
    
    [mTolMarkLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
    }];
    
    [mTolPriceMarkLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(mTolMarkLable.mas_right).with.offset(8);
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark event respose
-(void)onclickYueBtn:(UIButton *)sender{
    
}
#pragma mark  UITableViewDeleagte && UITableViewDataSoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1.0f;
    }else if (section == 1 || section == 2){
        return 3.0f;
    }
    return 0.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 2) {
        UIView *mFootView = [UIView new];
        [mFootView setBackgroundColor:[UIColor clearColor]];
        UILabel *mLable = [[UILabel alloc]init];
        [mLable setFont:DEFAULT_FONT(11)];
        [mLable setNumberOfLines:0];
        [mLable setTextColor:[UIColor colorWithHexString:@"c2c2c2"]];
        [mLable setText:@"请尊重对方并详细说明本次邀约的具体内容，这样被接受概率更大。违规信息将会作出相应的处罚。"];
        [mFootView addSubview:mLable];
        [mLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(16);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        return mFootView;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TMMHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMMHeadCell"];
        if (cell == nil) {
            cell = [[TMMHeadCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMMHeadCell"];
        }
        [cell setMName:@"Mla_D"];
        [cell setIsMan:YES];
        [cell setMSignature:@"快过年了，租个男朋友回家过年吧"];
        [cell setMHeadImage:[UIImage imageNamed:@"tm_header_def"]];
        return cell;
    }else if (indexPath.section == 1){
        TMMInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMMHeadCell"];
        if (cell == nil) {
            cell = [[TMMInfoCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMMHeadCell"];
        }
        [cell setMTitleStr:@[@"约见时间",@"时长",@"重庆"][indexPath.row]];
        [cell setMSubStr:@[@"2016-12-28 13:12",@"1小时",@"请选择公共场合"][indexPath.row]];
        if (indexPath.row == 2) {
            [cell setMarkImage:[UIImage imageNamed:@"tmd_dis_mark"]];
        }
        return cell;
    }else if (indexPath.section == 2){
        TMMPayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMMPayCell"];
        if (cell == nil) {
            cell = [[TMMPayCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TMMPayCell"];
        }
        [cell setMTitleStr:@[@"余额支付",@"微信支付",@"支付宝支付"][indexPath.row]];
        [cell setMarkImage:@[[UIImage imageNamed:@"tmm_ye"],[UIImage imageNamed:@"tmm_wx"],[UIImage imageNamed:@"tmm_zfb"]][indexPath.row]];
        [cell setIsSelected:YES];
        return cell;
    }
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        TMDatePickView *mDatePicker = [[TMDatePickView alloc]init];
        [self.navigationController.view addSubview:mDatePicker];
        [mDatePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        TMDataPickerView *mDatePicker = [[TMDataPickerView alloc]init];
        [mDatePicker setMPickerDataSoure:@[@"1天",@"2天",@"3天",@"1周"]];
        [self.navigationController.view addSubview:mDatePicker];
        [mDatePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        TMSelectMapPointVC *mSelectVC = [[TMSelectMapPointVC alloc]init];
        [self.navigationController pushViewController:mSelectVC animated:YES];
    }
}
@end
