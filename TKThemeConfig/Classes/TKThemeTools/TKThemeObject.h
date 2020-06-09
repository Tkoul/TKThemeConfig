//
//  TKThemeObject.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import <Foundation/Foundation.h>
#import "TKThemeManager+privateUpdate.h"
NS_ASSUME_NONNULL_BEGIN
#define tkIsMainThread ({([NSThread currentThread].isMainThread);})
#define TKUILog(_reason, ...) [TKThemeObject tkPrintWaringLog:__FILE__ line:__LINE__ func:__FUNCTION__ reason:_reason]
static NSString *tkUIControlStateNormal = @"UIControlStateNormal";
static NSString *tkUIControlStateHighlighted = @"UIControlStateHighlighted";
static NSString *tkUIControlStateDisabled  = @"UIControlStateDisabled ";
static NSString *tkUIControlStateSelected = @"UIControlStateSelected";
static NSString *tkUIControlStateFocused = @"UIControlStateFocused";
static NSString *tkUIControlStateApplication = @"UIControlStateApplication";
static NSString *tkUIControlStateReserved = @"UIControlStateReserved";

//实际变更索引 对应TKThemeManager的私有属性themeIndexRealy
static  NSString * tkThemenCofigIndex = @"themeIndexRealy";

@interface TKThemeObject : NSObject

/// 方法交换 实例方法
/// @param obClass 类
/// @param oldSelect 方法名
/// @param newSelect 新方法
+ (void)tkswizzledMethod:(Class)obClass methodOld:(SEL)oldSelect methodNew:(SEL)newSelect;
/// 方法交换 类方法
/// @param obClass 类
/// @param oldSelect 方法名
/// @param newSelect 新方法
+ (void)tkswizzledClassMethod:(Class)obClass methodOld:(SEL)oldSelect methodNew:(SEL)newSelect;


/// 设置UIControlState -转字符key
/// @param keyState UIControlState
+ (NSString *)tkKeyString:(UIControlState)keyState;

/// 设置字符key -转UIControlState
/// @param keyStr 字符key
+ (UIControlState )tkControlState:(NSString*)keyStr;

/// 根据目前主体索引获取颜色
/// @param colors 主题颜色数组
+ (UIColor*)tkThemeColors:(nullable NSArray <UIColor*> *)colors;

/// 根据目前主体索引获取图片
/// @param images 主题图片数组
+ (UIImage*)tkThemeImages:(nullable NSArray <UIImage*> *)images;

/// 根据UIControlState 与图片或者颜色不同组合 产生的数据进行保存，生成的设置的主题元素
/// @param oldThemeDic 老的元素
/// @param saveKey 保存的key
/// @param sourcearry 本次需要add或者替换的主题资源
/// @param state 对应的UIControlState
+ (NSMutableDictionary*)tksaveThemeoldThem:(NSDictionary*)oldThemeDic newKey:(NSString*)saveKey themeSourceArry:(NSArray*)sourcearry  forState:(UIControlState)state;

+(void)tkPrintWaringLog:(nullable const char *)file line:(int)line func:(nonnull const char *)func reason:(NSString*)reason;

@end

NS_ASSUME_NONNULL_END
