//
//  UITableView+TKUpdate.h
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (TKUpdate)
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property (nonatomic, copy, nullable) NSArray <UIColor*> *tkThemesectionIndexColors API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR;
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性// color used for text of the section index
@property (nonatomic, copy, nullable) NSArray <UIColor*> *tkThemesectionIndexBackgroundColors API_AVAILABLE(ios(7.0)) UI_APPEARANCE_SELECTOR;         // the background color of the section index while not being touched
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property (nonatomic, copy, nullable) NSArray <UIColor*> *tkThemesectionIndexTrackingBackgroundColors API_AVAILABLE(ios(6.0)) UI_APPEARANCE_SELECTOR; // the background color of the section index while it is being touched
/// 主题设置 在原属性加前缀tkTheme 变更为多主题数组属性。作用参照原属性
@property (nonatomic, copy, nullable) NSArray <UIColor*> *tkThemeseparatorColors UI_APPEARANCE_SELECTOR API_UNAVAILABLE(tvos); // default
@end

NS_ASSUME_NONNULL_END
