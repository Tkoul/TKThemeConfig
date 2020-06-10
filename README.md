# TKThemeConfig

[![CI Status](https://img.shields.io/travis/Tkoul/TKThemeConfig.svg?style=flat)](https://travis-ci.org/Tkoul/TKThemeConfig)
[![Version](https://img.shields.io/cocoapods/v/TKThemeConfig.svg?style=flat)](https://cocoapods.org/pods/TKThemeConfig)
[![License](https://img.shields.io/cocoapods/l/TKThemeConfig.svg?style=flat)](https://cocoapods.org/pods/TKThemeConfig)
[![Platform](https://img.shields.io/cocoapods/p/TKThemeConfig.svg?style=flat)](https://cocoapods.org/pods/TKThemeConfig)

## Introduce
ios暗黑模式,多主题多皮肤设计,用于解决在ios上实现可跟随系统主题变更，也可不跟随实现自定义主题模式设计。
本sdk可以支持任意多个主题。开发习惯上极度契合ios开发习惯，对于复杂的主题设置类，均可使用对象的
tkThemeChangeBlock进行回调设置变更。
优势：
1.代码无侵入,轻量级SDK。上手简单。完美解决多任务后台主题即时变更，屏幕快照变更主体。
2.全局控制，效率极高。用hashmap的形式管理block指针对象，轻量。
3.一切OC对象皆tkThemeChangeBlock主题回调，根据主题的目前的索引变更主题。
4.常用的UIKit的组件，赋予主题属性，主题方法等。直接设置主题颜色、图片数组即可。
  完全契合系统设置属性，方法习惯。
5.设计原理完美，弱引用的形式回调，不会对项目产生内存泄漏，内存占用不释放问题。UIKit-View层即用即注册，
  跟随对象释放即销毁。主题回调block即用即注册，跟随对象释放即销毁。
  
  PS:  欢迎交流 一起提升！邮箱Tkoull@163.com
  
  ## Move Show Style
  点击图片，跳转视频连接（ps：上传的视频到免费网站，有十几秒广告 😔 😌 😔 ），看下效果吧：
  如果图片裂开了，因为官网raw.GitHub的ip又变了，在电脑上添加host即可==》 199.232.28.133 raw.githubusercontent.com
  
 [![Watch the video](https://github.com/Tkoul/TKThemeConfig/blob/master/iosTheme.jpg)](https://v.youku.com/v_show/id_XNDcwNTcxODMwNA==.html)
  
  ## How To Get Started
  在使用到的地方  #import <TKThemeConfig/TKThemeConfig.h>
  在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 方法初始化
            
                - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
                {
                    //程序加载完毕 在其它组件含有UI元素前，优先设置主题 ，因为主题作用全局的UI
                    //可以设置YES 也可设置NO  根据自己的项目自行选择
                    [self changeThemeCofingFllowSystem:YES];
                    return YES;
                }
                #pragma mark -- 程序加载完毕 在其它组件含有UI元素前，优先设置主题 ，因为主题作用全局的UI
                - (void)changeThemeCofingFllowSystem:(BOOL)fllowSystemTheme{
                    if (fllowSystemTheme) {
                        //followSystemTheme 一旦设置YES themeIndex便失去作用 因为跟随系统变更。注释见TKThemeManager.h
                        [TKThemeManager config].followSystemTheme=YES;
                    }else{
                        //followSystemTheme 一旦设置NO themeIndex起作用.注释见TKThemeManager.h
                        [TKThemeManager config].followSystemTheme=NO;
                        [TKThemeManager config].themeIndex =0;
                    }
                    
                }
  
## Usage
## 1.便捷用法。
   sdk封装可常见的view控件。对于这些常见的控件，比如CALayer，UIView，UIImageView，UIButton，
UILabel等15个组件进行了贴合开发者的属性定制，在原属性上加前缀TKTheme。能满足80%以上的开发需求。
剩下的用万能方法即可。有时间功夫的小伙伴可以加入一起完善便捷用法哦。
示例如下：
// UIButton like   //UIImageView like    //CALayer like 。其它的可自行看头文件

           UIButton *themeSeting = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
           [themeSeting addTarget:self action:@selector(showSetingView:) forControlEvents:UIControlEventTouchUpInside];
           [themeSeting setTitle:@"打开设置" forState:UIControlStateNormal];
           [themeSeting setTkThemebackgroundColors:@[UIColor.redColor,UIColor.brownColor]];
           [self.view addSubview:themeSeting];

           UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, self.view.bounds.size.height/4+30, 180, 180)];
           [imageView setTkThemeimages:@[[UIImage imageNamed:@"001.jpg"],[UIImage imageNamed:@"002.jpg"]]];
           [self.view addSubview:imageView];
           
           CALayer *layer = [[CALayer alloc]init];
           layer.frame = CGRectMake(10, 10, self.view.bounds.size.width-20, self.view.bounds.size.height/4);
           layer.tkThemebackgroundColors = @[UIColor.brownColor,UIColor.darkGrayColor];
           [self.view.layer addSublayer:layer];
           
           
## 2.万能用法 。
 一切皆object对象,一切对象具备tkThemeChangeBlock（NSObject+TKUpdate.h),变更主题会触发
任意对象的tkThemeChangeBlock回调，可以在这个回调做主题设置。
本回调为主线程，进行UI主题变更，但是不要做耗时操作，耗时操作放到异步非主线程即可。
示例如下：
//view.tkThemeChangeBlock   //navigationBar.navigationBar

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


To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TKThemeConfig is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TKThemeConfig'
```

## Author

Tkoul, Tkoull@163.com

## License

TKThemeConfig is available under the MIT license. See the LICENSE file for more info.
            


