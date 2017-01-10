//
//  TMBaseViewController.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/4.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMBaseVC.h"
#import "TMBaseTabbarVC.h"
@interface TMBaseVC ()

@end

@implementation TMBaseVC{
    UITapGestureRecognizer *mTap;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageSize = 10;
    self.pageIndex = 1;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onclickGoBack:)];
    }
}
-(void)viewWillAppear:(BOOL)animated{
   // [self.navigationController setNavigationBarHidden:no animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    //[self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark public
-(UITableView *)createTableView{
   UITableView *mInfoTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    mInfoTableView.rowHeight = UITableViewAutomaticDimension;
    mInfoTableView.estimatedRowHeight = 100;
    mInfoTableView.tableFooterView = [UIView new];
    [mInfoTableView  setBackgroundColor:[UIColor whiteColor]];
    mInfoTableView.delegate = self;
    mInfoTableView.dataSource = self;
    mInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mInfoTableView.showsVerticalScrollIndicator = NO;
    mInfoTableView.showsHorizontalScrollIndicator = NO;
    return mInfoTableView;
}
-(UITableView *)createGourpTableView{
    UITableView *mInfoTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    mInfoTableView.rowHeight = UITableViewAutomaticDimension;
    mInfoTableView.estimatedRowHeight = 100;
    mInfoTableView.tableFooterView = [UIView new];
    [mInfoTableView  setBackgroundColor:[UIColor colorWithHexString:@"f1f1f1"]];
    mInfoTableView.delegate = self;
    mInfoTableView.dataSource = self;
    mInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mInfoTableView.showsVerticalScrollIndicator = NO;
    mInfoTableView.showsHorizontalScrollIndicator = NO;
    return mInfoTableView;
}
- (void)keyboardWillHide:(NSNotification *) notification {
    [self.view removeGestureRecognizer:mTap];
    mTap = nil;
}
- (void)keyboardWillShow:(NSNotification *) notification {
    if (mTap == nil) {
        mTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(allTFResignFirstResponder)];
        mTap.delegate = (id)self;
        [self.view addGestureRecognizer:mTap];
    }
}
-(void)hideZJTbar{
    if ([self.tabBarController isKindOfClass:[TMBaseTabbarVC class]]) {
        TMBaseTabbarVC *tempVC = (TMBaseTabbarVC *)self.tabBarController;
        self.tabBarController.tabBar.hidden = YES;
        tempVC.mBarView.hidden =YES;
        self.tabBarController.tabBar.hidden = YES;
    }
}
-(void)unHideZJTbar{
    if ([self.tabBarController isKindOfClass:[TMBaseTabbarVC class]]) {
        TMBaseTabbarVC *tempVC = (TMBaseTabbarVC *)self.tabBarController;
        tempVC.mBarView.hidden =NO;
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark event response
-(void)onclickGoBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  收起所有键盘
 */
-(void)allTFResignFirstResponder{
    LDLOG(@"收起所有的键盘");
    for (id temp in self.view.subviews) {
        if ([temp isKindOfClass:[UITextField class]]) {
            UITextField *tempTF = (UITextField *)temp;
            [tempTF resignFirstResponder];
        }else if ([temp isKindOfClass:[UITextView class]]){
            UITextView *tempTF = (UITextView *)temp;
            [tempTF resignFirstResponder];
        }else{
            if([temp isKindOfClass:[UIView class]]){
                UIView *tempView = (UIView *)temp;
                if (tempView.subviews.count>0) {
                    for (id temp1 in tempView.subviews) {
                        if ([temp1 isKindOfClass:[UITextField class]]) {
                            UITextField *tempTF = (UITextField *)temp1;
                            [tempTF resignFirstResponder];
                        }
                        if ([temp1 isKindOfClass:[UITextView class]]) {
                            UITextView *tempTF = (UITextView *)temp1;
                            [tempTF resignFirstResponder];
                        }
                    }
                }
            }
        }
    }
}
@end
