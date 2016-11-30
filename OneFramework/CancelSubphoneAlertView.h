//
//  CancelSubphoneAlertView.h
//  OneCardMultiNumber
//
//  Created by 涂真 on 16/8/11.
//  Copyright © 2016年 涂真. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CancelSubphoneAlertView : UIView
@property (nonatomic, copy) void (^confirmBlock)();///点击确认按钮之后要进行的回调操作

@property (nonatomic, copy) void (^abandomBlick)();///<点击放弃按钮之后要进行的回调
@property (nonatomic, copy) void (^agreementDetailBlock)();///<查看协议详情的操作
- (void)showCancelSubphoneAlertView;
@end
