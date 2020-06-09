//
//  CALayer+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/21.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN
@interface CALayer (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <UIColor*> *tkThemebackgroundColors;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <UIColor*> *tkThemeborderColors;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <UIColor*> *tkThemeshadowColors;

@end

NS_ASSUME_NONNULL_END
