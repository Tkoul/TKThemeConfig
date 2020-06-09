//
//  UIImageView+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,strong)NSArray <UIImage*> *tkThemeimages;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,strong)NSArray <UIImage*> *tkThemehightImages;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <NSArray <UIImage*> *> *tkThemeanimationImages;
/// 主题设置！ 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable,nonatomic,copy)NSArray <NSArray <UIImage*> *> *tkThemehighlightedAnimationImages;
@end

NS_ASSUME_NONNULL_END
