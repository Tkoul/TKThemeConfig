//
//  UILabel+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//

#import "UILabel+TKUpdate.h"

#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UILabel (TKUpdate)
//tkThemeTextColors
- (NSArray<UIColor *> *)tkThemetextColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemetextColors:(NSArray<UIColor *> *)tkThemetextColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemetextColors];
            color?[self setTextColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemetextColors];
                color?[self setTextColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemetextColors), tkThemetextColors, OBJC_ASSOCIATION_COPY);
    }
}


//tkThemeShadowColors
- (NSArray<UIColor *> *)tkThemeshadowColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeshadowColors:(NSArray<UIColor *> *)tkThemeshadowColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeshadowColors];
            color?[self setShadowColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeshadowColors];
                color?[self setShadowColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeshadowColors), tkThemeshadowColors, OBJC_ASSOCIATION_COPY);
    }
}
//tkThemehighlightedTextColors
- (NSArray<UIColor *> *)tkThemehighlightedTextColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemehighlightedTextColors:(NSArray<UIColor *> *)tkThemehighlightedTextColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemehighlightedTextColors];
            color?[self setHighlightedTextColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemehighlightedTextColors];
                color?[self setHighlightedTextColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemehighlightedTextColors), tkThemehighlightedTextColors, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
