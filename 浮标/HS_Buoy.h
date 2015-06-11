//
//  HS_Buoy.h
//  浮标
//
//  Created by colorPen on 15/6/11.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buoyClickBlock)();

@interface HS_Buoy : UIImageView

/*
 隐藏浮标
 **/
- (void)hideBuoy;
/*
 显示浮标
 **/
- (void)showBuoy;
/*
 移除浮标
 **/
- (void)removeBuoy;
/**
 *  单击手势
 */
- (void)clickBuoy:(buoyClickBlock)click;

@end
