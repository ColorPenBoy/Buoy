//
//  XcBuoy.m
//  浮标xc
//
//  Created by colorPen on 15/6/11.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//
#import "XcBuoy.h"
#define IPONE_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define IPONE_WIDTH     [UIScreen mainScreen].bounds.size.width

@implementation XcBuoy
{
    CGFloat xCenter;
    CGFloat yCenter;
    CGFloat buoyWith;
    CGFloat buoyHeight;
}
- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    buoyWith=image.size.width;
    buoyHeight=image.size.height;
    NSLog(@"%f %f",buoyHeight,buoyWith);
    self.frame=CGRectMake(0, 0, buoyWith, buoyHeight);
    self.userInteractionEnabled=YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    return self;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//开始移动浮标

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    xDistance =  self.center.x - currentPoint.x;
    yDistance = self.center.y - currentPoint.y;
    xCenter=self.center.x;
    yCenter=self.center.y;
    
}
//手指按住移动过程
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    
    //父视图中心点
    CGPoint superCenterPoint = self.superview.center;
    CGPoint newCenter = CGPointMake(currentPoint.x + xDistance, currentPoint.y + yDistance);
    self.center = newCenter;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveBuoy];
}
//  移动完浮标 复位
-(void)moveBuoy
{
    
        CGFloat statueHeight=20.0;
        CGFloat leftLength=self.center.x;
        CGFloat rightLength=IPONE_WIDTH-self.center.x;
        CGFloat topLength=self.center.y;
        CGFloat bottomLength=IPONE_HEIGHT-self.center.y-20;
        CGFloat durationTime=0.3;
    
        if (leftLength > rightLength)
        {
            [UIView animateWithDuration:durationTime animations:^{
                self.center=CGPointMake(IPONE_WIDTH-buoyWith/2, self.center.y);
            }];
        }
        else
        {
            [UIView animateWithDuration:durationTime animations:^{
                self.center=CGPointMake(buoyWith/2, self.center.y);
            }];
        }
        if (topLength < buoyHeight/2 + statueHeight)
        {
            [UIView animateWithDuration:durationTime animations:^{
                self.center=CGPointMake(self.center.x,buoyHeight/2);
            }];
        }
        if (bottomLength < buoyHeight/2)
        {
            [UIView animateWithDuration:durationTime animations:^{
                self.center=CGPointMake(self.center.x,IPONE_HEIGHT-buoyHeight/2-statueHeight);
            }];
        }
}


- (void)hideBuoy
{
    self.hidden=YES;
}
- (void)showBuoy
{
    self.hidden=NO;
}
- (void)removeBuoy
{
    [self removeFromSuperview];
}


@end
