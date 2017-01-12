//
//  TMUserCenterVC.h
//  taomeimei
//
//  Created by zfl－mac on 2017/1/10.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMBaseVC.h"

@interface TMUserCenterVC : TMBaseVC

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *topView;

- (IBAction)settingBtnClick:(id)sender;
- (IBAction)userInfoBtnClick:(id)sender;
- (IBAction)vipCenterBtnClick:(id)sender;
- (IBAction)moneyBtnClick:(id)sender;
- (IBAction)collectBtnClick:(id)sender;

@end
