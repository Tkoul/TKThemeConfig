//
//  UIWindow+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/6/2.
//

#import "UIWindow+TKUpdate.h"
#import "TKThemeConfig.h"
#import "TKThemeObject.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"

@implementation UIWindow (TKUpdate)
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000
- (UIUserInterfaceStyle)overrideUserInterfaceStyle{
    UIUserInterfaceStyle style = (UIUserInterfaceStyle)[objc_getAssociatedObject(self, _cmd) integerValue];
    return style;
}
- (void)setOverrideUserInterfaceStyle:(UIUserInterfaceStyle)overrideUserInterfaceStyle{
    if (@available(iOS 13.0, *)) {
        if ([TKThemeManager config].followSystemTheme) {
            objc_setAssociatedObject(self, @selector(overrideUserInterfaceStyle), @(UIUserInterfaceStyleUnspecified), OBJC_ASSOCIATION_ASSIGN);
        }else{
            objc_setAssociatedObject(self, @selector(overrideUserInterfaceStyle), @(overrideUserInterfaceStyle), OBJC_ASSOCIATION_ASSIGN);
        }
    }
}
#endif
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    if (![self isMemberOfClass:[UIWindow class]]) {
        return;
    }
    if (![TKThemeManager config].followSystemTheme) {
        return;
    }
    if (@available(iOS 13.0, *)) {
        UIApplicationState state = [UIApplication sharedApplication].applicationState;
        if (state == UIApplicationStateBackground) {
            //暗黑模式 z获取的是上次的模式  故而 设置需要写相反的模式
            if (previousTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                [[TKThemeManager config] setValue:@([TKThemeManager config].systemThemeDefaultIndex) forKey:tkThemenCofigIndex];
            }else{
                [[TKThemeManager config] setValue:@([TKThemeManager config].systemThemeDarkIndex) forKey:tkThemenCofigIndex];
            }
        }else{
            if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
                //暗黑模式 z获取的是上次的模式  故而 设置需要写相反的模式
                if (previousTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                    [[TKThemeManager config] setValue:@([TKThemeManager config].systemThemeDefaultIndex) forKey:tkThemenCofigIndex];
                }else{
                    [[TKThemeManager config] setValue:@([TKThemeManager config].systemThemeDarkIndex) forKey:tkThemenCofigIndex];
                }
            }
        }
    }else{
        // Fallback on earlier versions
    }
}
@end
