//
//  UITextView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UITextView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UITextView (TKUpdate)
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
@end
