//
//  UIButton+Countdown.m
//  taomeimei
//
//  Created by 刘冬 on 2017/1/3.
//  Copyright © 2017年 刘冬. All rights reserved.
//

#import "UIButton+Countdown.h"

@implementation UIButton (Countdown)
-(void)CountdownWithSeconds:(int)second description:(NSString *)des compleBlock:(void (^)())block{
    __block int timeout=second; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置 特别注明：UI的改变一定要在主线程中进行
                if (block) {
                    block();
                }
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,des] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
@end
