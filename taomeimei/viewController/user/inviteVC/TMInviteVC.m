//
//  TMInviteVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/13.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMInviteVC.h"
#import "TMInviteListVC.h"

@interface TMInviteVC ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@end

@implementation TMInviteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"邀请奖励";
    self.contentViewWidthConstraint.constant = MainScreenFrame_Width;
    self.contentViewHeightConstraint.constant = MainScreenFrame_Height-63;
    if (MainScreenFrame_Width == 320) {
        self.contentViewHeightConstraint.constant = 550;
    }
    
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(0, 0, 17, 19);
    [listBtn setImage:[UIImage imageNamed:@"invite_list_btn"] forState:UIControlStateNormal];
    [listBtn addTarget:self action:@selector(listBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:listBtn];
    [self.navigationItem setRightBarButtonItem:item];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}


- (void)listBtnClick:(id)sender{
    LDLOG(@"邀请列表");
    TMInviteListVC *inviteListVC = [[TMInviteListVC alloc] init];
    [self.navigationController pushViewController:inviteListVC animated:YES];
}

- (IBAction)inviteBtnClick:(id)sender {
    LDLOG(@"邀请好友");
    
}

- (IBAction)shareBtnClick:(id)sender {
    LDLOG(@"通过朋友圈分享");
    
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
