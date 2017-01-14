//
//  TMCloseAddressBookVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/13.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMCloseAddressBookVC.h"

@interface TMCloseAddressBookVC ()

@property (weak, nonatomic) IBOutlet UISwitch *addressBookSwitch;

@end

@implementation TMCloseAddressBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"屏蔽通讯录";
    self.view.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}

- (IBAction)switchValueChanged:(UISwitch*)sender {
    
    LDLOG(@"switch==%d",sender.on);
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
