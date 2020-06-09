//
//  NSObject+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/27.
//


#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
///一切主题皆对象，皆可使用tkThemeChangeBlock主题回调  根据主题的目前的索引变更主题
typedef void(^tkThemeChangeBlock)(id _Nullable itself, NSUInteger themeIndex);
@interface NSObject (TKUpdate)
///一切主题皆对象，皆可使用tkThemeChangeBlock主题回调  根据主题的目前的索引变更主题。itself为本身的弱引用，具体使用强转下类型。本回调为UI主题变更不要做耗时操作，耗时操作放到异步非主线程即可
@property(nonnull,nonatomic,copy)tkThemeChangeBlock tkThemeChangeBlock;
@end

NS_ASSUME_NONNULL_END
