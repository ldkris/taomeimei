//
//  TMSettingVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMSettingVC.h"
#import "TMSettingCell.h"

#import "TMPayPasswordVC.h"
#import "TMBlacklistVC.h"

@interface TMSettingVC (){
    NSArray *imageArr;
    NSArray *textArr;
}

@end

@implementation TMSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"设置";
    imageArr = @[@"setting_password",@"setting_blacklist",@"setting_friend",@"setting_feedback",@"setting_clear",@"setting_about",@"setting_logout"];
    textArr = @[@"余额支付密码",@"黑名单",@"屏蔽通讯录",@"意见反馈",@"清除缓存",@"关于我们",@"退出登录"];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return imageArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    TMSettingCell *cell = (TMSettingCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TMSettingCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    cell.imageV.image = [UIImage imageNamed:imageArr[indexPath.row]];
    cell.textLab.text = textArr[indexPath.row];
    if (indexPath.row == imageArr.count-1) {
        cell.line.hidden = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            //设置支付密码
            TMPayPasswordVC *payPasswordVC = [[TMPayPasswordVC alloc] initWithNibName:@"TMPayPasswordVC" bundle:nil];
            [self.navigationController pushViewController:payPasswordVC animated:YES];
        }
            break;
        case 1:
        {
            //黑名单
            TMBlacklistVC *blacklistVC = [[TMBlacklistVC alloc] initWithNibName:@"TMBlacklistVC" bundle:nil];
            [self.navigationController pushViewController:blacklistVC animated:YES];
        }
            break;
        case 2:
        {
        }
            break;
        case 3:
        {
        }
            break;
        case 4:
        {
        }
            break;
        case 5:
        {
        }
            break;
        case 6:
        {
        }
            break;
        default:
            break;
    }
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
