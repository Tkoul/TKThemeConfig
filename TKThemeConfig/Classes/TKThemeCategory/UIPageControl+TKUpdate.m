//
//  UIPageControl+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UIPageControl+TKUpdate.h"

#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UIPageControl (TKUpdate)
- (NSArray<UIColor*>*)tkThemePageIndicatorTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemePageIndicatorTintColors:(NSArray<UIColor *> *)tkThemePageIndicatorTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemePageIndicatorTintColors];
            color?[self setPageIndicatorTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemePageIndicatorTintColors];
                color?[self setPageIndicatorTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemePageIndicatorTintColors), tkThemePageIndicatorTintColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThemeCurrentPageIndicatorTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}

- (void)setTkThemeCurrentPageIndicatorTintColors:(NSArray<UIColor *> *)tkThemeCurrentPageIndicatorTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeCurrentPageIndicatorTintColors];
            color?[self setCurrentPageIndicatorTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeCurrentPageIndicatorTintColors];
                color?[self setCurrentPageIndicatorTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeCurrentPageIndicatorTintColors), tkThemeCurrentPageIndicatorTintColors, OBJC_ASSOCIATION_COPY);
    }
}
@end
