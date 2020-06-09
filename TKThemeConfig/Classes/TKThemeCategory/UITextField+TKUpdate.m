//
//  UITextField+TKUpdateTextField.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UITextField+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UITextField (TKUpdate)
- (NSArray<UIColor*>*)tkThemetextColors{
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

- (NSArray<UIImage*>*)tkThemebackgrounds{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemebackgrounds:(NSArray<UIImage *> *)tkThemebackgrounds{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemebackgrounds];
            image?[self setBackground:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemebackgrounds];
                image?[self setBackground:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemebackgrounds), tkThemebackgrounds, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIImage*>*)tkThemedisabledBackgrounds{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemedisabledBackgrounds:(NSArray<UIImage *> *)tkThemedisabledBackgrounds{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemedisabledBackgrounds];
            image?[self setDisabledBackground:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemedisabledBackgrounds];
                image?[self setDisabledBackground:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemedisabledBackgrounds), tkThemedisabledBackgrounds, OBJC_ASSOCIATION_COPY);
    }
}
@end
