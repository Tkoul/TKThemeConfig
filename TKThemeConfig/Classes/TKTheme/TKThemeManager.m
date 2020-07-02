//
//  TKThemeManager.m
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//

#import "TKThemeManager.h"
#import "UIView+TKUpdate.h"
#import "CALayer+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeObject.h"
#import "UIWindow+TKUpdate.h"
@interface TKThemeManager ()
//清除block定时器
@property(strong,nonatomic)NSTimer  *clearnBlockTimer;
//储存block的hash素组
@property(strong,nonatomic)NSMutableArray  *tkBlockArry;
//实际起作用的设置主题的随用
@property(assign,nonatomic)NSUInteger themeIndexRealy;

@property (nonatomic ,strong)dispatch_source_t timer;

@end

@implementation TKThemeManager
@synthesize themeIndex = _themeIndex;
static TKThemeManager *config = nil;
static dispatch_once_t onceToken;
+ (instancetype)config{
    if (config == nil) {
        dispatch_once(&onceToken, ^{
            config = [[TKThemeManager alloc] init];
            [config tkThemeManagerInit];
        });
    }
    return config;
}
/// 初始化
- (void)tkThemeManagerInit{
    //如果允许app主题跟随系统 则变更  Default -- YES
    self.followSystemTheme = YES;
    self.themeIndex = 0;
    self.systemThemeDefaultIndex = 0;
    self.systemThemeDarkIndex = 1;
    config.tkBlockArry = [[NSMutableArray alloc]initWithCapacity:30000];
    config.tkThemeBlock = ^(tkThemeChange  _Nonnull themeBloc) {
        if (themeBloc!=nil) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                @synchronized (config) {
                    if (themeBloc!=nil) {
                        [config.tkBlockArry addObject:themeBloc];
                    }
                }
            });
        }
    };
    NSTimeInterval period = 15.0; //设置时间间隔
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, period * NSEC_PER_SEC, 0*NSEC_PER_SEC); //每15秒执行
    dispatch_source_set_event_handler(_timer, ^{    //在这里执行事件
        [self tkThmenConfigClearnBlocks];
    });
    dispatch_resume(_timer);
    self.timer = _timer;
}
//清除可销毁block。进行清除销毁
- (void)tkThmenConfigClearnBlocks{
//    NSLog(@"ClearnBlocks");
    [self tkReloadThemeConfig:NO];
}


- (void)setFollowSystemTheme:(BOOL)followSystemTheme{
    if (_followSystemTheme!=followSystemTheme) {
        _followSystemTheme = followSystemTheme;
        if (followSystemTheme) {
            if (@available(iOS 13.0, *)) {
                if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    self.themeIndexRealy = 1;
                }else{
                    self.themeIndexRealy = 0;
                }
            }
        }
    }
    
}

/// 获取当前索引  get方法  获取的值为 实际索引
- (NSUInteger)themeIndex{
    _themeIndex = _themeIndexRealy;
    return _themeIndex;
}
/// 变更主题 外部设置 只有在不跟随系统设置才会生效
/// @param themeIndex 主题索引
- (void)setThemeIndex:(NSUInteger)themeIndex{
    if (self.themeIndexRealy!=themeIndex) {
        _themeIndex = themeIndex;
        if (self.followSystemTheme) {
            return;
        }
        //调用实际生成主题的索引
        self.themeIndexRealy = themeIndex;
    }
}

/// 设置主题的实际方法
/// @param themeIndexRealy  主题索引
- (void)setThemeIndexRealy:(NSUInteger)themeIndexRealy{
    _themeIndexRealy = themeIndexRealy;
    if (tkIsMainThread) {
        [self tkReloadThemeConfig:YES];
    }else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self tkReloadThemeConfig:YES];
        });
    }
}
- (void)tkReloadThemeConfig:(BOOL)changeTheme{
    @synchronized (self) {
        NSMutableArray *deleteArry = [[NSMutableArray alloc]initWithCapacity:30000];
        //        NSLog(@"变更======%d",config.tkBlockArry.count);
        for (tkThemeChange tkIndexBloc in config.tkBlockArry) {
            BOOL isNil = tkIndexBloc(changeTheme);
            if (isNil) {
                [deleteArry addObject:tkIndexBloc];
            }
        }
        [config.tkBlockArry  removeObjectsInArray:deleteArry];
    }
}
@end
