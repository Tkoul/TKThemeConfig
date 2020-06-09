//
//  UITabBar+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UITabBar+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UITabBar (TKUpdate)
- (NSArray<UIColor*>*)tkThemebarTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemebarTintColors:(NSArray<UIColor *> *)tkThemebarTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemebarTintColors];
            color?[self setBarTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemebarTintColors];
                color?[self setBarTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemebarTintColors), tkThemebarTintColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThemeunselectedItemTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeunselectedItemTintColors:(NSArray<UIColor *> *)tkThemeunselectedItemTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeunselectedItemTintColors];
            color?[self setUnselectedItemTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeunselectedItemTintColors];
                color?[self setUnselectedItemTintColor:color]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemeunselectedItemTintColors), tkThemeunselectedItemTintColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIImage*>*)tkThemebackgroundImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemebackgroundImages:(NSArray<UIImage *> *)tkThemebackgroundImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemebackgroundImages];
            image?[self setBackgroundImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemebackgroundImages];
                image?[self setBackgroundImage:image]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemebackgroundImages), tkThemebackgroundImages, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIImage*>*)tkThemeselectionIndicatorImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeselectionIndicatorImages:(NSArray<UIImage *> *)tkThemeselectionIndicatorImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeselectionIndicatorImages];
            image?[self setBackgroundImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeselectionIndicatorImages];
                image?[self setBackgroundImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeselectionIndicatorImages), tkThemeselectionIndicatorImages, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIImage*>*)tkThemeshadowImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeshadowImages:(NSArray<UIImage *> *)tkThemeshadowImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeshadowImages];
            image?[self setShadowImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeshadowImages];
                image?[self setShadowImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeshadowImages), tkThemeshadowImages, OBJC_ASSOCIATION_COPY);
    }
}

@end
