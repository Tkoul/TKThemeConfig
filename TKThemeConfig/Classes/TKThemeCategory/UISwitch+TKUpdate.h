//
//  UISwitch+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISwitch (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic, copy)  NSArray <UIColor*>  *tkThemeonTintColors API_AVAILABLE(ios(5.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic, copy)  NSArray <UIColor*> *tkThemethumbTintColors API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic, copy)  NSArray <UIImage*> *tkThemeonImages API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic, copy)  NSArray <UIImage*> *tkThemeoffImages API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
@end

NS_ASSUME_NONNULL_END
