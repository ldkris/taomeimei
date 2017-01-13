//
//  TMChatListVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/13.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMChatListVC.h"
#import "TMChatVC.h"
#import "TMBaseTabbarVC.h"
@interface TMChatListVC ()

@end

@implementation TMChatListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    
    self.showRefreshHeader = YES;
    self.delegate = (id)self;
    self.dataSource = (id)self;
 
    [EaseImageView appearance].imageCornerRadius = 20.0;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self tableViewDidTriggerHeaderRefresh];
    [self unHideZJTbar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel{
    TMChatVC *viewController = [[TMChatVC alloc] initWithConversationChatter:conversationModel.conversation.conversationId conversationType:conversationModel.conversation.type];
    viewController.title = conversationModel.title;
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)unHideZJTbar{
    if ([self.tabBarController isKindOfClass:[TMBaseTabbarVC class]]) {
        TMBaseTabbarVC *tempVC = (TMBaseTabbarVC *)self.tabBarController;
        tempVC.mBarView.hidden =NO;
        
    }
}


@end
