//
//  TMUserInfoVC.m
//  taomeimei
//
//  Created by zfl－mac on 2017/1/11.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "TMUserInfoVC.h"
#import "TMUserInfoTableCell.h"
#import "userNameChangeVC.h"
#import "TMPickerView.h"

@interface TMUserInfoVC ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,TMPickerViewDelegate>
{
    NSArray *textArr;
    NSArray *constellationArr;//星座
}
@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, strong) TMPickerView *constellationPicker;
@end

@implementation TMUserInfoVC
@synthesize picker;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人信息";
    textArr = @[@"昵称",@"微信号",@"职业",@"性别",@"年龄",@"星座",@"身高"];
    constellationArr = @[@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座"];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    [self hideZJTbar];
}

#pragma  mark - UITableViewDataSource
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    header.frame = CGRectMake(0, 0, 0, 10);
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return textArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 67.f;
    }
    else {
        return 46.f;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    TMUserInfoTableCell *cell = (TMUserInfoTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"TMUserInfoTableCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    if (indexPath.row == textArr.count-1) {
        cell.line.hidden = YES;
    }
    if (indexPath.section == 0) {
        cell.imageV.hidden = NO;
        cell.subTextLab.hidden = YES;
        cell.textLab.text = @"头像";
    }
    else {
        cell.imageV.hidden = YES;
        cell.subTextLab.hidden = NO;
        cell.textLab.text = textArr[indexPath.row];
    }
    return cell;
}

#pragma  mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"头像"
                                                       delegate:(id<UIActionSheetDelegate>)self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"拍照",@"相册", nil];
        actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
        actionSheet.tag = 100;
        [actionSheet showInView:self.view];
        return;
    }
    if (indexPath.row == 0) {//昵称
        userNameChangeVC *nameChangeVC = [[userNameChangeVC alloc] initWithNibName:@"userNameChangeVC" bundle:nil];
        [self.navigationController pushViewController:nameChangeVC animated:YES];
    }
    if (indexPath.row == 3) {//性别
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"性别"
                                                                delegate:(id<UIActionSheetDelegate>) self
                                                        cancelButtonTitle:@"取消"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"男生",@"女生", nil];
        actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
        actionSheet.tag = 203;
        [actionSheet showInView:self.view];
    }
    if (indexPath.row == 5) {//星座
        self.constellationPicker = [TMPickerView makeViewWithMaskDatePicker:self.view.frame setTitle:@"" Arr:constellationArr];
        self.constellationPicker.delegate = self;
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    LDLOG(@"actionSheet tag==%ld",actionSheet.tag);
    if (actionSheet.tag == 100) {//头像
        LDLOG(@"buttonIndex ====%ld",buttonIndex);
        if (buttonIndex <= 1) {
            
            if (!self.picker) {
                self.picker = [[UIImagePickerController alloc] init];
                picker.delegate = self;
                
            }
            if (buttonIndex == 0) {
                if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
                    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                    picker.showsCameraControls = YES;
                    picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
                    picker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
                }
            }
            if (buttonIndex == 1){
                if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
                    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                }
            }
            
            picker.allowsEditing = YES;
            
            [self presentViewController:picker animated:YES completion:nil];
            
        }
    }
    if (actionSheet.tag == 203) {//性别
        LDLOG(@"buttonIndex ====%ld",buttonIndex);
        
        
    }
}

#pragma mark --UIImagePickerController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self.picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -TMPickerViewDelegate

-(void)getPickerViewValue:(NSString *)values {
    LDLOG(@"getPickerViewValue===%@",values);
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
