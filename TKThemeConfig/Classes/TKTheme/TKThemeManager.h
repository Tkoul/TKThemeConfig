//
//  TKThemeManager.h
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface TKThemeManager : NSObject

/// 单利方法 初始化主题管理
+ (instancetype)config;

#pragma mark --跟随系统主题 多主题模式  themeIndex 无效
///是否跟随系统的浅色/深色模式主题  默认YES   themeIndex 将失效
/// 并且themeIndex的值跟随系统  default:0 dark:1
@property(assign,nonatomic,getter=isFollowSystemTheme)BOOL followSystemTheme;
/// 在跟随系统主题变换模式下followSystemTheme = YES ！ 系统为light 对应的 我们自己的主题索引   默认0
@property(assign,nonatomic)NSUInteger systemThemeDefaultIndex;
/// 在跟随系统主题变换模式下followSystemTheme = YES ！ 系统为dark 对应的 我们自己的主题索引   默认1
@property(assign,nonatomic)NSUInteger systemThemeDarkIndex;

#pragma mark --不跟随系统主题 多主题模式
/// 设置主题索引。支持多主题  默认0 
/// 如果followSystemTheme==YES  themeIndex设置任意值均无效
/// 如设置view背景色方法
/// [view setTkThemebackgroundColors:@[UIColor.whiteColor,UIColor.darkGrayColor,UIColor.blueColor]];
/// themeIndex = 0; 即whiteColor； themeIndex = 1; 即darkGrayColor； themeIndex = 2;即blueColor；
@property(assign,nonatomic,readwrite)NSUInteger themeIndex;


@end

NS_ASSUME_NONNULL_END
