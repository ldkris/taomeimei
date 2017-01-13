//
//  TMSelectMapPointView.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/12.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMSelectMapPointVC.h"
#import "TMTableViewCell.h"
@interface TMSelectMapPointVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKPoiSearchDelegate,UISearchBarDelegate,BMKSuggestionSearchDelegate,BMKGeoCodeSearchDelegate>
@property(nonatomic,retain)NSMutableArray *mDataSoure;
@property (nonatomic,strong) UISearchBar *searchBar;
@end

@implementation TMSelectMapPointVC{
    BMKLocationService* _locService;
    BMKMapView* _mapView;
    BMKGeoCodeSearch* _geocodesearch;
    BMKSuggestionSearch *_searcher;
    
    UITableView *mInfoTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    _mapView = [[BMKMapView alloc]init];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    _mapView.showsUserLocation = YES;
    _mapView.zoomLevel = 13.f;
    [self.view addSubview:_mapView];
    
    mInfoTableView = [self createTableView];
    [self.view addSubview:mInfoTableView];
    
    _locService = [[BMKLocationService alloc]init];
    _locService.distanceFilter = 1000;
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _searcher =[[BMKSuggestionSearch alloc]init];
    
    [_locService startUserLocationService];
    
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenFrame_Width, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, MainScreenFrame_Width - 40, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入要搜索的文字";
    self.searchBar.showsCancelButton = YES;
    // 键盘确认按钮的名字
    self.searchBar.returnKeyType = UIReturnKeySearch;
    // 把默认灰色背景浮层给去掉
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.backgroundImage = [UIImage new];
    [[[self.searchBar.subviews objectAtIndex:0].subviews objectAtIndex:1] setTintColor:[UIColor blueColor]];
    UITextField *searBarTextField = [self.searchBar valueForKey:@"_searchField"];
    if (searBarTextField)
    {
        [searBarTextField setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
        searBarTextField.borderStyle = UITextBorderStyleRoundedRect;
        searBarTextField.layer.cornerRadius = 5.0f;
    }
    else
    {
        // 通过颜色画一个Image出来
//        UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1] forSize:CGSizeMake(28, 28)];
//        [self.searchBar setSearchFieldBackgroundImage:image forState:UIControlStateNormal];
    }
    [titleView addSubview:self.searchBar];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = (id)self;
    _searcher.delegate = self;
    
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(-1);
        make.bottom.equalTo(self.view.mas_centerY);
    }];
    
    [mInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mapView.mas_bottom);
        make.bottom.right.left.mas_equalTo(0);
    }];
}
-(void)viewWillDisappear:(BOOL)animated{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _locService.delegate = nil;
    _geocodesearch.delegate = nil;
}
- (void)dealloc {
    if (_locService) {
        _locService = nil;
    }
    if (_mapView) {
        _mapView = nil;
    }
    if (_geocodesearch) {
        _geocodesearch = nil;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark getter
-(NSMutableArray *)mDataSoure{
    if (_mDataSoure == nil) {
        _mDataSoure = [NSMutableArray array];
    }
    return _mDataSoure;
}
#pragma mark BMKUserLocationDelegare
//用户位置更新后，会调用此函数
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = userLocation.location.coordinate;
    [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
    
    [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    [_mapView updateLocationData:userLocation];
}
#pragma mark BMKGeoCodeSearchDelegate
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == 0) {
        [self.mDataSoure removeAllObjects];
        [self.mDataSoure addObjectsFromArray:result.poiList];
        [mInfoTableView reloadData];
    }
}

#pragma mark BMKSuggestionSearch
- (void)onGetSuggestionResult:(BMKSuggestionSearch*)searcher result:(BMKSuggestionResult*)result errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        [self.mDataSoure removeAllObjects];
        NSArray *mkey =result.keyList;
        NSArray *mlat = result.ptList;
        NSArray *mCity = result.cityList;
        NSArray *mDis = result.districtList;
        if (mkey && mlat && mkey.count == mlat.count) {
            for (int i = 0; i<mkey.count; i++) {
                NSString *cityName = [mCity objectAtIndex:i];
                if (cityName == nil) {
                    cityName = @"";
                }
                NSString *disName = [mDis objectAtIndex:i];
                if (disName == nil) {
                    disName = @"";
                }
                
                NSString *subTitle = [cityName stringByAppendingString:disName];
                
                BMKPoiInfo *tempPoiInfo = [[BMKPoiInfo alloc]init];
                tempPoiInfo.name = mkey[i];
                tempPoiInfo.address = [subTitle stringByAppendingString:mkey[i]];
                NSValue *ptValue = mlat[i];
                CLLocationCoordinate2D pt;
                [ptValue getValue:&pt];
                tempPoiInfo.pt =  pt;
                [self.mDataSoure addObject:tempPoiInfo];
            }
        }

        [mInfoTableView reloadData];
    }
    else
    {
        NSLog(@"抱歉，未找到结果");
    }
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    // [self.navigationController dismissViewControllerAnimated:YES completion:nil];
   // [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{

}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    
    BMKSuggestionSearchOption* option = [[BMKSuggestionSearchOption alloc] init];
    option.keyword  = searchBar.text;
    [_searcher suggestionSearch:option];
}
#pragma mark UITableViewDelegate && UITableViewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mDataSoure.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifiy = @"TMTableViewCell";
    TMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifiy];
    if (cell == nil) {
        cell = [[TMTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifiy];
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    BMKPoiInfo *tempInfo = self.mDataSoure[indexPath.row];
    if ([tempInfo isKindOfClass:[BMKPoiInfo class]]) {
        cell.textLabel.text = tempInfo.name;
        cell.detailTextLabel.text = tempInfo.address;
    }
    else
    {
        
    }
   
    return cell;
}
@end
