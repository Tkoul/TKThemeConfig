//
//  UITextField+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,strong) NSArray<UIColor*>   *tkThemetextColors;            // default is nil. use opaque black
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,strong) NSArray<UIImage*>   *tkThemebackgrounds;           // default is nil. draw in border rect. image should be stretchable
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property(nullable, nonatomic,strong) NSArray<UIImage*>   *tkThemedisabledBackgrounds;   // default is nil. ignored if background not set. image should be stretchable
@end

NS_ASSUME_NONNULL_END
