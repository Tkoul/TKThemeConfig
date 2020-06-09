//
//  CALayer+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/21.
//

#import "CALayer+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
#import "NSObject+TKUpdate.h"
@interface CALayer ()
@property(nonatomic,assign)BOOL  initThemeCofig;
@end
@implementation CALayer (TKUpdate)
#pragma --mark   是否设置主题
- (BOOL)initThemeCofig{
    @synchronized (self) {
        return  (BOOL)objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setInitThemeCofig:(BOOL)initThemeCofig{
    @synchronized (self) {
        objc_setAssociatedObject(self, @selector(initThemeCofig), @(initThemeCofig), OBJC_ASSOCIATION_ASSIGN);
    }
}
#pragma --mark   背景色
- (NSArray<UIColor*>*)tkThemebackgroundColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemebackgroundColors:(NSArray<UIColor *> *)tkThemebackgroundColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject  tkThemeColors:tkThemebackgroundColors];
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            color?[self setBackgroundColor:color.CGColor]:nil;
            [CATransaction commit];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject  tkThemeColors:tkThemebackgroundColors];
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                color?[self setBackgroundColor:color.CGColor]:nil;
                [CATransaction commit];
                
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemebackgroundColors), tkThemebackgroundColors, OBJC_ASSOCIATION_COPY);
    }
    [self tkThemeLayerConfig];
}

#pragma --mark   shadow Colors
- (NSArray <UIColor*> *)tkThemeborderColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeborderColors:(NSArray<UIColor *> *)tkThemeborderColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeborderColors];
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            color?[self setBorderColor:color.CGColor]:nil;
            [CATransaction commit];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeborderColors];
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                color?[self setBorderColor:color.CGColor]:nil;
                [CATransaction commit];
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeborderColors), tkThemeborderColors, OBJC_ASSOCIATION_COPY);
    }
    [self tkThemeLayerConfig];
}

#pragma --mark   是否设置主题
- (NSArray <UIColor*> *)tkThemeshadowColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeshadowColors:(NSArray<UIColor *> *)tkThemeshadowColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            UIColor *color = [TKThemeObject tkThemeColors:tkThemeshadowColors];
            color?[self setShadowColor:color.CGColor]:nil;
            [CATransaction commit];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [CATransaction begin];
                [CATransaction setDisableActions:YES];
                UIColor *color = [TKThemeObject tkThemeColors:tkThemeshadowColors];
                color?[self setShadowColor:color.CGColor]:nil;
                [CATransaction commit];
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemeshadowColors), tkThemeshadowColors, OBJC_ASSOCIATION_COPY);
    }
    [self tkThemeLayerConfig];
}
- (void)tkThemeLayerConfig{
    //防止多次初始化
    if (!self.initThemeCofig) {
        self.initThemeCofig = YES;
        __weak typeof(self) weakSelf = self;
        [TKThemeManager config].tkThemeBlock(^BOOL(BOOL themeChange) {
            __weak typeof(weakSelf) strongSelf = weakSelf;
            if (themeChange&&strongSelf) {
                strongSelf.tkThemebackgroundColors!=nil? strongSelf.tkThemebackgroundColors = strongSelf.tkThemebackgroundColors:nil;
                strongSelf.tkThemeborderColors!=nil? strongSelf.tkThemeborderColors = strongSelf.tkThemeborderColors:nil;
                strongSelf.tkThemeshadowColors!=nil?strongSelf.tkThemeshadowColors = strongSelf.tkThemeshadowColors:nil;
            }
            return strongSelf?NO:YES;
        });
    }
}

@end
