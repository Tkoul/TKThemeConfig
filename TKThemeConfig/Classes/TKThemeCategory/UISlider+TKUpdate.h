//
//  UISlider+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISlider (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,copy) NSArray <UIImage*>  *tkThememinimumValueImage;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,copy) NSArray <UIImage*>  *tkThememaximumValueImage;

/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,copy) NSArray <UIColor*>  *tkThememinimumTrackTintColor;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,copy) NSArray <UIColor*>  *tkThememaximumTrackTintColor;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,copy) NSArray <UIColor*>  *tkThemethumbTintColor;

/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)tkThemesetThumbImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state;
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)tkThemesetMinimumTrackImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state;
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)tkThemesetMaximumTrackImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state;
///SDK内部变量  控制方法的入参组合  对外无需设置实现
@property(nullable,nonatomic,strong)NSMutableDictionary *tkThemeImageDic;
@end

NS_ASSUME_NONNULL_END
