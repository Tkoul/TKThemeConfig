//
//  TKThemeManager+privateUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/6/8.
//


#import "TKThemeManager.h"
typedef BOOL (^tkThemeChange)(BOOL themeChange);
NS_ASSUME_NONNULL_BEGIN
@interface TKThemeManager ()
//本类的属性block 外部不让用户使用 定义为 私有拓展 
@property(nonatomic,copy,readwrite)void (^tkThemeBlock)(tkThemeChange themeBloc);
@end

NS_ASSUME_NONNULL_END
