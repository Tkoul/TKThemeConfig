//
//  TKDemoViewCtrl.m
//  TKThemeConfig_Example
//
//  Created by Tkoul on 2020/5/20.
//  Copyright © 2020 Tkoul. All rights reserved.
//

#import "TKDemoViewCtrl.h"
#import <TKThemeConfig/TKThemeConfig.h>
#import "TKSetingView.h"
@interface TKDemoViewCtrl ()
{
    TKSetingView  *seting;
}
@end

@implementation TKDemoViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ps:demo 随便写的 代码堆起来的的，无各种规范，只做展示。嘿嘿，别太注意细节 😀
    
    //1.万能用法 ，一切皆对象。  一切对象具备tkThemeChangeBlock（NSObject+TKUpdate  tkThemeChangeBlock。本回调为主线程，进行UI主题变更，但是不要做耗时操作，耗时操作放到异步非主线程即可。
    //示例如下：
    self.view.tkThemeChangeBlock = ^(id  _Nullable itself, NSUInteger themeIndex) {
        UIColor *color = nil;
        if (themeIndex==0) {
            color = UIColor.whiteColor;
        }else{
            color = UIColor.blackColor;
        }
        [(UIView*)itself setBackgroundColor:color];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           //如果除了UI操作，还有其它耗时操作，放到其它非主线程队列
           // do something, while the long operation is underway.
        });
    };
    self.navigationController.navigationBar.tkThemeChangeBlock = ^(id  _Nullable itself, NSUInteger themeIndex) {
        UIImage *image = nil;
        if (themeIndex==0) {
            image = [UIImage imageNamed:@"005.png"];
        }else{
            image = [UIImage imageNamed:@"007.png"];
        }
        [(UINavigationBar*)itself setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    };
    
    //2.便捷用法， sdk封装可常见的view控件。对于这些常见的控件，比如CALayer，UIView，UIImageView，UIButton，UILabel等15个组件进行了贴合开发者的属性定制，在原属性上加前缀TKTheme。能满足80%以上的开发需求。剩下的用万能方法即可。有时间功夫的小伙伴可以加入一起完善便捷用法哦。
    //示例如下：
    
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(10, 10, self.view.bounds.size.width-20, self.view.bounds.size.height/4);
    layer.tkThemebackgroundColors = @[UIColor.brownColor,UIColor.darkGrayColor];
    [self.view.layer addSublayer:layer];
    
    UIButton *themeSeting = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    [themeSeting addTarget:self action:@selector(showSetingView:) forControlEvents:UIControlEventTouchUpInside];
    [themeSeting setTitle:@"打开设置" forState:UIControlStateNormal];
    [themeSeting setTkThemebackgroundColors:@[UIColor.redColor,UIColor.brownColor]];
    [self.view addSubview:themeSeting];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, self.view.bounds.size.height/4+30, 180, 180)];
    [imageView setTkThemeimages:@[[UIImage imageNamed:@"001.jpg"],[UIImage imageNamed:@"002.jpg"]]];
    [self.view addSubview:imageView];
    
    UIImageView *imageViewS = [[UIImageView alloc]initWithFrame:CGRectMake(220, self.view.bounds.size.height/4+30, 180, 180)];
    imageViewS.tkThemeChangeBlock = ^(id  _Nullable itself, NSUInteger themeIndex) {
        UIImage *image = nil;
        if (themeIndex==0) {
            image = [UIImage imageNamed:@"003.png"];
        }else{
            image = [UIImage imageNamed:@"004.png"];
        }
        [(UIImageView*)itself setImage:image];
    };
    [self.view addSubview:imageViewS];
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, imageViewS.frame.origin.y+180+20, self.view.bounds.size.width-20, 35)];
    lable.text = @"随心所欲，心之所致，主题变更";
    lable.font = [UIFont boldSystemFontOfSize:20];
    [lable setTextAlignment:NSTextAlignmentCenter];
    [lable  setTkThemebackgroundColors:@[UIColor.cyanColor,UIColor.darkGrayColor]];
    lable.tkThemetextColors = @[UIColor.redColor,UIColor.whiteColor];
    [self.view addSubview:lable];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, lable.frame.origin.y+50, self.view.bounds.size.width-40, self.view.frame.size.height -( lable.frame.origin.y+180));
    [button.imageView.layer setMasksToBounds:YES];
    [button setTitle:@"Button 变更主题颜色" forState:UIControlStateNormal];
    [button setTkThemeBackgroundImage:@[[UIImage imageNamed:@"001.jpg"],[UIImage imageNamed:@"002.jpg"]] forState:UIControlStateNormal];
    [button setTkThemeBackgroundImage:@[[UIImage imageNamed:@"003.jpg"],[UIImage imageNamed:@"004.jpg"]] forState:UIControlStateHighlighted];
    button.tkThemeChangeBlock = ^(id  _Nullable itself, NSUInteger themeIndex) {
        UIColor  *color = nil;
        if (themeIndex==0) {
            color  = UIColor.brownColor;
            [[(UIButton*)itself titleLabel] setFont:[UIFont systemFontOfSize:30]];
        }else{
            color  = UIColor.redColor;
            [[(UIButton*)itself titleLabel] setFont:[UIFont boldSystemFontOfSize:10]];
        }
        [(UIButton*)itself  setTitleColor:color forState:UIControlStateNormal];
    };
    [self.view  addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showSetingView:(UIButton*)sender{
   
    if (!seting) {
        seting = [[TKSetingView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-400)];
    }
    [self.view addSubview:seting];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
