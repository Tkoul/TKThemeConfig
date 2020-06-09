//
//  UITableView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UITableView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UITableView (TKUpdate)
- (NSArray<UIColor*>*)tkThemesectionIndexColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemesectionIndexColors:(NSArray<UIColor *> *)tkThemesectionIndexColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexColors];
            color?[self setSectionIndexColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexColors];
                color?[self setSectionIndexColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemesectionIndexColors), tkThemesectionIndexColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThemesectionIndexBackgroundColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemesectionIndexBackgroundColors:(NSArray<UIColor *> *)tkThemesectionIndexBackgroundColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexBackgroundColors];
            color?[self setSectionIndexBackgroundColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexBackgroundColors];
                color?[self setSectionIndexBackgroundColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemesectionIndexBackgroundColors), tkThemesectionIndexBackgroundColors, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIColor*>*)tkThemesectionIndexTrackingBackgroundColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemesectionIndexTrackingBackgroundColors:(NSArray<UIColor *> *)tkThemesectionIndexTrackingBackgroundColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexTrackingBackgroundColors];
            color?[self setSectionIndexTrackingBackgroundColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemesectionIndexTrackingBackgroundColors];
                color?[self setSectionIndexTrackingBackgroundColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemesectionIndexTrackingBackgroundColors), tkThemesectionIndexTrackingBackgroundColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThemeseparatorColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeseparatorColors:(NSArray<UIColor *> *)tkThemeseparatorColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeseparatorColors];
            color?[self setSeparatorColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeseparatorColors];
                color?[self setSeparatorColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeseparatorColors), tkThemeseparatorColors, OBJC_ASSOCIATION_COPY);
    }
}
@end
