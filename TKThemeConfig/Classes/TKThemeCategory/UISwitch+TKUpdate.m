//
//  UISwitch+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UISwitch+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UISwitch (TKUpdate)
- (NSArray<UIColor*>*)tkThemeonTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeonTintColors:(NSArray<UIColor *> *)tkThemeonTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeonTintColors];
            color?[self setOnTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeonTintColors];
                color?[self setOnTintColor:color]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemeonTintColors), tkThemeonTintColors, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIColor*>*)tkThemethumbTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemethumbTintColors:(NSArray<UIColor *> *)tkThemethumbTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemethumbTintColors];
            color?[self setThumbTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemethumbTintColors];
                color?[self setThumbTintColor:color]:nil;
            });
            objc_setAssociatedObject(self, @selector(tkThemethumbTintColors), tkThemethumbTintColors, OBJC_ASSOCIATION_COPY);
        }
    }
}

- (NSArray<UIImage*>*)tkThemeonImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeonImages:(NSArray<UIImage *> *)tkThemeonImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeonImages];
            image?[self setOnImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeonImages];
                image?[self setOnImage:image]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemeonImages), tkThemeonImages, OBJC_ASSOCIATION_COPY);
    }
}


- (NSArray<UIImage*>*)tkThemeoffImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeoffImages:(NSArray<UIImage *> *)tkThemeoffImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeoffImages];
            image?[self setOffImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeoffImages];
                image?[self setOffImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeoffImages), tkThemeoffImages, OBJC_ASSOCIATION_COPY);
    }
}
@end
