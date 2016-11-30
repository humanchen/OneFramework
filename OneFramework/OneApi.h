//
//  OneApi.h
//  OneApi
//
//  Created by 陈思宇 on 16/11/24.
//  Copyright © 2016年 陈思宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CancelSubphoneAlertView.h"
@interface OneApi : NSObject

+(CancelSubphoneAlertView *)getCancelViewWithFrame:(CGRect)frame;
@end
