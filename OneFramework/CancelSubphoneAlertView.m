//
//  CancelSubphoneAlertView.m
//  OneCardMultiNumber
//
//  Created by 涂真 on 16/8/11.
//  Copyright © 2016年 涂真. All rights reserved.
//

#import "CancelSubphoneAlertView.h"

@interface CancelSubphoneAlertView ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *beCanceledSubphoneLabel;///<被取消的副号

@property (weak, nonatomic) IBOutlet UIView *alertView;

@property (weak, nonatomic) IBOutlet UIButton *agreeCheckBtn;///<同意协议的勾选按钮
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;///<确认按钮

///放弃
- (IBAction)abandonAction:(id)sender;

///确认
- (IBAction)confirmAction:(id)sender;

///查看协议详情
- (IBAction)AgreementDetailAction:(id)sender;

///同意协议的勾选按钮触发事件
- (IBAction)agreeCheckAction:(id)sender;


@property (nonatomic, assign) CGRect alertViewbounds;

@end

@implementation CancelSubphoneAlertView


#pragma mark - 公开方法
- (void)showCancelSubphoneAlertView{
    

    self.alertView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
         self.alertView.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - 重写父类方法
- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.7];
    self.agreeCheckBtn.selected = YES;
    
    //为遮罩层添加手势
//    self.alertView.userInteractionEnabled = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewTapAction:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
   
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //设置圆角
    self.alertView.layer.cornerRadius = 6;
    self.alertView.layer.masksToBounds = YES;
    
    //设置确认按钮的可点击状态
    self.confirmBtn.enabled = NO;
    if (self.agreeCheckBtn.isSelected) {
        self.confirmBtn.enabled = YES;
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - action
///查看协议详情
- (IBAction)AgreementDetailAction:(id)sender {
//    NSURL *url = [NSURL URLWithString:@"http://hdh.10086.cn/law/index.jsp"];
//    [[UIApplication sharedApplication] openURL:url];
    self.hidden = YES;
    if (self.agreementDetailBlock) {
        self.agreementDetailBlock();
    }
}


///同意协议的勾选按钮触发事件
- (IBAction)agreeCheckAction:(id)sender {
    self.agreeCheckBtn.selected = !self.agreeCheckBtn.isSelected;
    if (self.agreeCheckBtn.isSelected) {
        self.confirmBtn.enabled = YES;
    }else{
     self.confirmBtn.enabled = NO;
//        [self.confirmBtn setstat] ;
    }
}

///放弃
- (IBAction)abandonAction:(id)sender {
    if (self.abandomBlick) {
        self.abandomBlick();
    }
    [self hiddenCancelSubphoneAlertView];
}

///确认
- (IBAction)confirmAction:(id)sender {
    
    if (self.confirmBlock) {
        self.confirmBlock();
    }
    [self hiddenCancelSubphoneAlertView];

}

//这招层tapAction
- (void)coverViewTapAction:(UITapGestureRecognizer *)tap{
    [self hiddenCancelSubphoneAlertView];
}


#pragma mark - 内部方法

///隐藏alertView
- (void)hiddenCancelSubphoneAlertView{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(0.4, 0.4);
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        if (self.superview) {
            [self removeFromSuperview];
        }
    }];
    
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
   
    if (touch.view == self.alertView) {
        return NO;
    }
    return YES;
}
@end
