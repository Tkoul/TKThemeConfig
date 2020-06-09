//
//  UITabBar+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic, copy) NSArray <UIColor*> *tkThemebarTintColors API_AVAILABLE(ios(7.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property (nonatomic, readwrite, copy, nullable) NSArray <UIColor*> *tkThemeunselectedItemTintColors API_AVAILABLE(ios(10.0)) UI_APPEARANCE_SELECTOR;

/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
/* The background image will be tiled to fit, even if it was not created via the UIImage resizableImage methods.
 */
@property(nullable, nonatomic, copy) NSArray <UIImage*> *tkThemebackgroundImages API_AVAILABLE(ios(5.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
/* The selection indicator image is drawn on top of the tab bar, behind the bar item icon.
 */
@property(nullable, nonatomic, copy) NSArray <UIImage*> *tkThemeselectionIndicatorImages API_AVAILABLE(ios(5.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
/* Default is nil. When non-nil, a custom shadow image to show instead of the default shadow image. For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage: (if the default background image is used, the default shadow image will be used).
 */
@property(nullable, nonatomic, copy) NSArray <UIImage*> *tkThemeshadowImages API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;

@end

NS_ASSUME_NONNULL_END
