//
//  ViewController.m
//  HSBuoyDemo
//
//  Created by 张强 on 16/3/29.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"
#import "HSBuoy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HSBuoy *shopcart = [[HSBuoy alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    shopcart.image = [UIImage imageNamed:@"MyBuoy"];
    [shopcart clickBuoy:^{
        
        NSLog(@"Click Buoy");
        
    }];
    [self.view addSubview:shopcart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
