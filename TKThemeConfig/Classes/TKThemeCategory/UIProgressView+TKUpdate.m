//
//  UIProgressView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UIProgressView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UIProgressView (TKUpdate)
- (NSArray<UIColor*>*)tkThemeProgressTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeProgressTintColors:(NSArray<UIColor *> *)tkThemeProgressTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor  *color = [TKThemeObject tkThemeColors:tkThemeProgressTintColors];
            color?[self setProgressTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor  *color = [TKThemeObject tkThemeColors:tkThemeProgressTintColors];
                color?[self setProgressTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeProgressTintColors), tkThemeProgressTintColors, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIColor*>*)tkThemeTrackTintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeTrackTintColors:(NSArray<UIColor *> *)tkThemeTrackTintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor  *color = [TKThemeObject tkThemeColors:tkThemeTrackTintColors];
            color?[self setTrackTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor  *color = [TKThemeObject tkThemeColors:tkThemeTrackTintColors];
                color?[self setTrackTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeTrackTintColors), tkThemeTrackTintColors, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIImage*>*)tkThemeProgressImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeProgressImages:(NSArray<UIImage *> *)tkThemeProgressImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image =[TKThemeObject tkThemeImages:tkThemeProgressImages];
            image?[self setProgressImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image =[TKThemeObject tkThemeImages:tkThemeProgressImages];
                image?[self setProgressImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeProgressImages), tkThemeProgressImages, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIImage*>*)tkThemeTrackImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeTrackImages:(NSArray<UIImage *> *)tkThemeTrackImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeTrackImages];
            image?[self setTrackImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeTrackImages];
                image?[self setTrackImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeTrackImages), tkThemeTrackImages, OBJC_ASSOCIATION_COPY);
    }
}
@end
