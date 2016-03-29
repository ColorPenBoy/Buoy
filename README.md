# Buoy

浮标悬浮在ViewController上方，或者UIWindow上方，可以随意拖动，结束拖动后自动靠在边框上。

* 使用方法：

``` objective-c
HS_Buoy * buoy = [[HS_Buoy alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
buoy.image = [UIImage imageNamed:@"MyBuoy"];
[buoy clickBuoy:^{
    // Click Buoy Call Back    
	NSLog(@"Click Buoy");        
}];
[self.view addSubview:shopcart];
```

