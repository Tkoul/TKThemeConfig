//
//  UIButton+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <UIColor*> *tkThemetintColors;
/// 主题设！ 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)setTkThemeTitleColor:(nullable NSArray <UIColor*> *)colors forState:(UIControlState)state; // default is nil. use opaque white
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)setTkThemeTitleShadowColor:(nullable NSArray <UIColor*> *)colors forState:(UIControlState)state; // default is nil. use 50% black
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)setTkThemeImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state;
// default is nil. should be same size if different for different states
/// 主题设置 在原方法加前缀tkTheme 变更为多主题数组属性。作用参照原方法
- (void)setTkThemeBackgroundImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state; // default is nil
///SDK内部变量  控制方法的入参组合  对外无需设置实现
@property(nullable,nonatomic,strong)NSMutableDictionary *tkBtnThemeColorDic;
@end

NS_ASSUME_NONNULL_END
