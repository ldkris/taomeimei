//
//  TMBaseViewController.h
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBaseVC : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,assign)NSInteger pageIndex;
@property(nonatomic,assign)NSInteger pageSize;

-(void)hideZJTbar;
-(void)unHideZJTbar;

- (void)keyboardWillShow:(NSNotification *) notification;
- (void)keyboardWillHide:(NSNotification *) notification;

- (UITableView *)createTableView;
@end
