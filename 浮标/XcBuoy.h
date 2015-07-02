//
//  XcBuoy.h
//  浮标xc
//
//  Created by colorPen on 15/6/11.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface XcBuoy : UIImageView
{
    CGFloat xDistance; //触摸点和中心点x方向移动的距离
    CGFloat yDistance; //触摸点和中心点y方向移动的距离
}
- (id)initWithImage:(UIImage *)image;
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


@end
