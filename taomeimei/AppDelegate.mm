//
//  AppDelegate.m
//  taomeimei
//
//  Created by 刘冬 on 2016/12/30.
//  Copyright © 2016年 刘冬. All rights reserved.
//

#import "AppDelegate.h"
#import "TMAdvertisementVC.h"

@interface AppDelegate (){
    BMKLocationService* _locService;
    BMKMapManager* _mapManager;
}
@property(retain,nonatomic)CLLocationManager *locationManager;
@end

@implementation AppDelegate

#pragma mark getter
-(CLLocationManager *)locationManager{
    if (_locationManager == nil) {
        _locationManager =  [[CLLocationManager alloc]init];
    }
    return _locationManager;
}
-(void)registerLocationPermissions:(CLLocationManager *)locationMangae{
    // 判断是否 iOS 8
    if([locationMangae respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationMangae requestAlwaysAuthorization]; // 永久授权
        [locationMangae requestWhenInUseAuthorization]; //使用中授权
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        [locationMangae requestWhenInUseAuthorization];//?只在前台开启定位
        [locationMangae requestAlwaysAuthorization];//?在后台也可定位
    }
    // 5.iOS9新特性：将允许出现这种场景：同一app中多个location manager：一些只能在前台定位，另一些可在后台定位（并可随时禁止其后台定位）。
    //        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
    //            locationMangae.allowsBackgroundLocationUpdates = YES;
    //        }
    
    [locationMangae startUpdatingLocation];
}
-(void)registerUerNotificationCompetence{
    UIApplication *application = [UIApplication sharedApplication];
    application.applicationIconBadgeNumber = 0;
    
    if([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationType notificationTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
    }
#if !TARGET_IPHONE_SIMULATOR
    //iOS8 注册APNS
    if ([application respondsToSelector:@selector(registerForRemoteNotifications)]) {
        [application registerForRemoteNotifications];
    }else{
        UIRemoteNotificationType notificationTypes = UIRemoteNotificationTypeBadge |
        UIRemoteNotificationTypeSound |
        UIRemoteNotificationTypeAlert;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:notificationTypes];
    }
#endif
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //liudong
    
    [self registerUerNotificationCompetence];
    [self registerLocationPermissions:self.locationManager];
    
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:@"y1rACuHmNdh2Ujqt9Mc1HA2obD55l371" generalDelegate:(id)self];
    if (!ret) {
        LDLOG(@"manager start failed!");
    }
    
    if (self.window == nil) {
        self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, MainScreenFrame_Width, MainScreenFrame_Height)];
        [self.window setBackgroundColor:[UIColor whiteColor]];
    }
    
    TMAdvertisementVC *mRootVC = [[TMAdvertisementVC alloc]init];
    [self.window setRootViewController:mRootVC];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        LDLOG(@"联网成功");
    }
    else{
        LDLOG(@"onGetNetworkState %d",iError);
    }
    
}
- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        LDLOG(@"授权成功");
    }
    else {
        LDLOG(@"onGetPermissionState %d",iError);
    }
}

@end
