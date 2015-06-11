//
//  ViewController.m
//  浮标
//
//  Created by colorPen on 15/6/11.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "ViewController.h"

#import "HS_Buoy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HS_Buoy *shopcart = [[HS_Buoy alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    shopcart.image = [UIImage imageNamed:@"v5login_small"];
    [shopcart clickBuoy:^{
        
        NSLog(@"单击了浮标");
        
    }];
    [self.view addSubview:shopcart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
