//
//  UISlider+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UISlider+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
static NSString *tkThumbImage = @"tkThumbImage";
static NSString *tkMinimumTrackImage = @"tkMinimumTrackImage";
static NSString *tkMaximumTrackImage = @"tkMaximumTrackImage";
@implementation UISlider (TKUpdate)
#pragma --mark -image
- (NSArray<UIImage*>*)tkThememinimumValueImage{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThememinimumValueImage:(NSArray<UIImage *> *)tkThememinimumValueImage{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThememinimumValueImage];
            image?[self setMinimumValueImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThememinimumValueImage];
                image?[self setMinimumValueImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThememinimumValueImage), tkThememinimumValueImage, OBJC_ASSOCIATION_COPY);
    }
}
- (NSArray<UIImage*>*)tkThememaximumValueImage{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThememaximumValueImage:(NSArray<UIImage *> *)tkThememaximumValueImage{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThememaximumValueImage];
            image?[self setMaximumValueImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThememaximumValueImage];
                image?[self setMaximumValueImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThememaximumValueImage), tkThememaximumValueImage, OBJC_ASSOCIATION_COPY);
    }
}

#pragma --mark colors
- (NSArray<UIColor*>*)tkThememinimumTrackTintColor{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThememinimumTrackTintColor:(NSArray<UIColor *> *)tkThememinimumTrackTintColor{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThememinimumTrackTintColor];
            color?[self setMinimumTrackTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThememinimumTrackTintColor];
                color?[self setMinimumTrackTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThememinimumTrackTintColor), tkThememinimumTrackTintColor, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThememaximumTrackTintColor{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThememaximumTrackTintColor:(NSArray<UIColor *> *)tkThememaximumTrackTintColor{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThememaximumTrackTintColor];
            color?[self setMaximumTrackTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThememaximumTrackTintColor];
                color?[self setMaximumTrackTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThememaximumTrackTintColor), tkThememaximumTrackTintColor, OBJC_ASSOCIATION_COPY);
    }
}


- (NSArray<UIColor*>*)tkThemethumbTintColor{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemethumbTintColor:(NSArray<UIColor *> *)tkThemethumbTintColor{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemethumbTintColor];
            color?[self setThumbTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemethumbTintColor];
                color?[self setThumbTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemethumbTintColor), tkThemethumbTintColor, OBJC_ASSOCIATION_COPY);
    }
}
#pragma mark --image设置

- (NSMutableDictionary*)tkThemeImageDic{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeImageDic:(NSMutableDictionary *)tkThemeImageDic{
    @synchronized (self) {
        if (tkIsMainThread) {
            [self tkSliderThemeChangeAllTheme];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self tkSliderThemeChangeAllTheme];
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeImageDic), tkThemeImageDic, OBJC_ASSOCIATION_RETAIN);
    }
}

- (void)tkThemesetThumbImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state{
    
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkThumbImage themeSourceArry:images forState:state];
    
}
- (void)tkThemesetMinimumTrackImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state{
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkMinimumTrackImage themeSourceArry:images forState:state];
}
- (void)tkThemesetMaximumTrackImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state{
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkMaximumTrackImage themeSourceArry:images forState:state];
}


- (void)tkSliderThemeChangeAllTheme{
    NSArray  *arryThme = [self.tkThemeImageDic allKeys];
    if ([arryThme containsObject:tkThumbImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkThumbImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setThumbImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkMinimumTrackImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkMinimumTrackImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setMinimumTrackImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkMaximumTrackImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkMaximumTrackImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setMaximumTrackImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
}


@end
