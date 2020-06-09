//
//  UIActivityIndicatorView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UIActivityIndicatorView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UIActivityIndicatorView (TKUpdate)
- (NSArray<UIColor*>*)tkThemecolors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemecolors:(NSArray<UIColor *> *)tkThemecolors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject  tkThemeColors:tkThemecolors];
            color?[self setColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject  tkThemeColors:tkThemecolors];
                color?[self setColor:color]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemecolors), tkThemecolors, OBJC_ASSOCIATION_COPY);
    }
}

@end
