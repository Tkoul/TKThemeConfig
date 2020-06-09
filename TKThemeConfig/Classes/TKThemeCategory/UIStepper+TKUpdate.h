//
//  UIStepper+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStepper (TKUpdate)
/// 主题设置 在方法性加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)tkThemesetBackgroundImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)tkThemesetDividerImage:(nullable NSArray <UIImage*> *)images forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
// the glyph image for the plus/increase button
- (void)tkThemesetIncrementImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
// the glyph image for the minus/decrease button
- (void)tkThemesetDecrementImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;

///SDK内部变量  控制方法的入参组合  对外无需设置实现
@property(nullable,nonatomic,strong)NSMutableDictionary *tkThemeImageDic;
@end

NS_ASSUME_NONNULL_END
