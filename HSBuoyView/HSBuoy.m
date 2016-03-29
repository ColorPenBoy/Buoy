//
//  HS_Buoy.m
//  浮标
//
//  Created by colorPen on 15/6/11.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//
#import "HSBuoy.h"

#define IPONE_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define IPONE_WIDTH     [UIScreen mainScreen].bounds.size.width

static CGFloat const statueHeight = 20.0;
static CGFloat const tabbarHeight = 49.0;
//static CGFloat const navigationHeight = 64.0;
static NSTimeInterval const durationTime = 0.3;

@interface HSBuoy ()

@property (nonatomic, assign) CGFloat xDistance; //触摸点和中心点x方向移动的距离
@property (nonatomic, assign) CGFloat yDistance; //触摸点和中心点y方向移动的距离

@property (nonatomic, assign) CGFloat xCenter;
@property (nonatomic, assign) CGFloat yCenter;
@property (nonatomic, assign) CGFloat buoyWith;
@property (nonatomic, assign) CGFloat buoyHeight;

@property (nonatomic, copy) HS_BuoyClickBlock buoyClickBlock_t;

@end


@implementation HSBuoy

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled=YES;
    }
    return self;
}
//单击图标手势
- (void)clickBuoy:(HS_BuoyClickBlock)click
{
    self.buoyClickBlock_t = [click copy];
    
    UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapMoveImageView1)];
    [self addGestureRecognizer:myTap];
}
- (void)onTapMoveImageView1
{
    if (self.buoyClickBlock_t) {
        self.buoyClickBlock_t();
    }
}

// 开始移动浮标
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch       = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    self.xDistance       = self.center.x - currentPoint.x;
    self.yDistance       = self.center.y - currentPoint.y;
    self.xCenter         = self.center.x;
    self.yCenter         = self.center.y;

}
// 手指按住移动过程
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    
    //父视图中心点
//    CGPoint superCenterPoint = self.superview.center;
    
    CGPoint newCenter = CGPointMake(currentPoint.x + self.xDistance, currentPoint.y + self.yDistance);
    self.center = newCenter;
}

//  移动完浮标 复位
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGFloat leftLength   = self.center.x;
    CGFloat rightLength  = IPONE_WIDTH - self.center.x;
    CGFloat topLength    = self.center.y;
    CGFloat bottomLength = IPONE_HEIGHT - self.center.y - 20;
    
    if (leftLength > rightLength) {
        [UIView animateWithDuration:durationTime animations:^{
            self.center=CGPointMake(IPONE_WIDTH - self.bounds.size.width/2, self.center.y);
        }];
    }
    else
    {
        [UIView animateWithDuration:durationTime animations:^{
            self.center=CGPointMake(self.bounds.size.width/2, self.center.y);
        }];
    }
    
    if (topLength < self.bounds.size.height/2 + statueHeight)
    {
        [UIView animateWithDuration:durationTime animations:^{
            self.center=CGPointMake(self.center.x,self.bounds.size.height/2 + statueHeight);
        }];
    }
    if (bottomLength < self.bounds.size.height/2)
    {
        [UIView animateWithDuration:durationTime animations:^{
            self.center = CGPointMake(self.center.x,IPONE_HEIGHT - self.bounds.size.height/2 - tabbarHeight);
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
