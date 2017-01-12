//
//  TMRenterVC.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/7.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMRenterVC.h"
#import "TMRNavView.h"
#import "TMRenterListInfoCell.h"
#import "TMRenterDetailVC.h"
#import "TMFiltrateVC.h"
#import "CityViewController.h"
#import "MKJFirstViewController.h"
#import "WJItemsControlView.h"
@interface TMRenterVC ()

@end

@implementation TMRenterVC{
    TMRNavView *mNavView;
    UITableView *mInfoTableView;
    BOOL isPush;
    WJItemsControlView *_itemControlView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mNavView = [[TMRNavView alloc]init];
    [mNavView setMpageSize:5];
    [mNavView setMBgImage:[UIImage imageNamed:@"tm_nav_bg"]];
    __weak __typeof__(self) weakSelf = self;
    [mNavView setDidFiltrateBlcock:^(UIButton *sender) {
       //筛选
        TMFiltrateVC *mFileTrateVC = [[TMFiltrateVC alloc]init];
        [weakSelf.navigationController pushViewController:mFileTrateVC animated:YES];
    }];
    [mNavView setDidSearchBtnBlcock:^(UIButton *sender) {
        //搜索
        MKJFirstViewController *first = [[MKJFirstViewController alloc]init];
        [weakSelf.navigationController pushViewController:first animated:YES];
    }];
    [mNavView setDidSelectCityBtnBlcock:^(UIButton *sender) {
        //选择城市
        CityViewController *controller = [[CityViewController alloc] init];
        controller.currentCityString = @"重庆";
        controller.selectString = ^(NSString *string){
            
        };
        [weakSelf presentViewController:controller animated:YES completion:nil];
    }];
    [self.view addSubview:mNavView];
    
    isPush = YES;
    
    
    float widht = [UIScreen mainScreen].bounds.size.width;
    float heith = [UIScreen mainScreen].bounds.size.height;
    
    NSArray *array = @[@"新上架",@"附近",@"高颜值区",@"低价区",@"认证"];
    
    //4页内容的scrollView
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, widht, heith-150)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(widht*array.count, 100);
    
    for (int i=0; i<array.count; i++) {
        UITableView *mTablView = [self createTableView];
        [mTablView setFrame:CGRectMake(widht*i, 0, widht, heith-150)];
        [scroll addSubview:mTablView];
    }
    [self.view addSubview:scroll];
    
    
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = widht/4.0;
    config.itemFont = DEFAULT_FONT(14);
    config.textColor = [UIColor whiteColor];
    config.selectedColor = [UIColor colorWithHexString:@"ffaec1"];

    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 100-40, widht, 44)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    
    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        
        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
        
    }];
    [self.view addSubview:_itemControlView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self unHideZJTbar];    
    [mNavView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(105);
    }];

}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    if (self.navigationController.viewControllers.count>1) {
        isPush = NO;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate && UITableViewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TMRenterListInfoCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"TMRenterListInfoCell"];
    if (!cell) {
        cell = [[TMRenterListInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TMRenterListInfoCell"];
    }
    [cell setMName:@"Mlao_D"];
    [cell setMPrice:@"200/时"];
    [cell setMSignature:@"租个男友回家过年吧！"];
    [cell setMArea:@"重庆"];
    [cell setMProfession:@"自由职业"];
    [cell setMImage:[UIImage imageNamed:@"tm_renter_def"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TMRenterDetailVC *mRenterDetailVC = [[TMRenterDetailVC alloc]init];
    [self.navigationController pushViewController:mRenterDetailVC animated:YES];
}
#pragma mark scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if([scrollView isKindOfClass:[UITableView class]]){
        return;
    }
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([scrollView isKindOfClass:[UITableView class]]){
    return;
    }
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
    
}
@end
