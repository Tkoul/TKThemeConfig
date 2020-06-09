//
//  NSObject+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/27.
//

#import "NSObject+TKUpdate.h"
#import "TKThemeObject.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
@interface NSObject ()
@property(nonatomic,assign)BOOL  initThemeCofig;
@end
@implementation NSObject (TKUpdate)
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
- (tkThemeChangeBlock)tkThemeChangeBlock{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}

- (void)setTkThemeChangeBlock:(tkThemeChangeBlock)tkThemeChangeBlock{
    @synchronized (self) {
        objc_setAssociatedObject(self, @selector(tkThemeChangeBlock), tkThemeChangeBlock, OBJC_ASSOCIATION_COPY);
    }
    __weak typeof(self) weakself = self;
    if (tkIsMainThread) {
        
        if (self.tkThemeChangeBlock) {
            self.tkThemeChangeBlock(weakself, [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue]);
        }
        [self tkThemeConfigBlock];
    }else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (weakself.tkThemeChangeBlock) {
                weakself.tkThemeChangeBlock(weakself, [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue]);
            }
            [weakself tkThemeConfigBlock];
        });
    }
}

#pragma --mark  comman config
- (void)tkThemeConfigBlock{
    //防止多次初始化
    if (!self.initThemeCofig) {
        self.initThemeCofig = YES;
        __weak typeof(self) weakSelf = self;
        [TKThemeManager config].tkThemeBlock(^BOOL(BOOL themeChange) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (themeChange&&strongSelf) {
                if (strongSelf.tkThemeChangeBlock) {
                    if (tkIsMainThread) {
                        strongSelf.tkThemeChangeBlock(strongSelf, [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue]);
                    }else{
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            strongSelf.tkThemeChangeBlock(strongSelf, [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue]);
                        });
                    }
                    
                }
            }
            return strongSelf?NO:YES;
        });
    }
}
@end
