//
//  TMUserCenterVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMUserCenterVC.h"
#import "TMUserCenterTableCell.h"

#import "TMSettingVC.h"
#import "TMUserInfoVC.h"
#import "TMInviteVC.h"

@interface TMUserCenterVC (){
    
    NSArray *imageArr;
    NSArray *textArr;
    
}

@end

@implementation TMUserCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView setTableHeaderView:self.topView];
    imageArr = @[@[@"userCenter_rent_out",@"userCenter_rent_in"],@[@"userCenter_auth",@"userCenter_ invite"]];
    textArr = @[@[@"我租了谁",@"谁租了我"],@[@"个人认证",@"邀请奖励"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self unHideZJTbar];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    header.frame = CGRectMake(0, 0, 0, 10);
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return imageArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = imageArr[section];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    TMUserCenterTableCell *cell = (TMUserCenterTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TMUserCenterTableCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    NSArray *imageA = imageArr[indexPath.section];
    NSArray *textA = textArr[indexPath.section];
    cell.imageV.image = [UIImage imageNamed:imageA[indexPath.row]];
    cell.textLab.text = textA[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //我租了谁
        }
        if (indexPath.row == 1) {
            //谁租了我
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //个人认证
        }
        if (indexPath.row == 1) {
            //邀请奖励
            TMInviteVC *inviteVC = [[TMInviteVC alloc] initWithNibName:@"TMInviteVC" bundle:nil];
            [self.navigationController pushViewController:inviteVC animated:YES];
        }
    }
}

- (IBAction)settingBtnClick:(id)sender {
    LDLOG(@"设置");
    TMSettingVC *settingVC = [[TMSettingVC alloc] initWithNibName:@"TMSettingVC" bundle:nil];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (IBAction)userInfoBtnClick:(id)sender {
    LDLOG(@"个人信息");
    TMUserInfoVC *userInfoVC = [[TMUserInfoVC alloc] initWithNibName:@"TMUserInfoVC" bundle:nil];
    [self.navigationController pushViewController:userInfoVC animated:YES];
}
- (IBAction)vipCenterBtnClick:(id)sender {
    LDLOG(@"会员中心");
}
- (IBAction)moneyBtnClick:(id)sender {
    LDLOG(@"我的钱包");
}

- (IBAction)collectBtnClick:(id)sender {
    LDLOG(@"我的收藏");
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
