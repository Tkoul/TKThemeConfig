//
//  UIButton+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/21.
//

#import "UIButton+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
static NSString *tkThemetitleColor = @"tkThemetitleColor";
static NSString *tkThemeTitleShadowColor = @"tkThemeTitleShadowColor";
static NSString *tkThemeImage = @"tkThemeImage";
static NSString *tkThemeBackgroundImage = @"tkThemeBackgroundImage";
@implementation UIButton (TKUpdate)

- (NSArray<UIColor *> *)tkThemetintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemetintColors:(NSArray<UIColor *> *)tkThemetintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color = [TKThemeObject tkThemeColors:tkThemetintColors];
            color?[self setTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color = [TKThemeObject tkThemeColors:tkThemetintColors];
                color?[self setTintColor:color]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemetintColors), tkThemetintColors, OBJC_ASSOCIATION_COPY);
    }
}


- (NSMutableDictionary *)tkBtnThemeColorDic{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkBtnThemeColorDic:(NSMutableDictionary *)tkBtnThemeColorDic{
    @synchronized (self) {
        if (tkIsMainThread) {
            [self tkBtnThemeChangeAllTheme];
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self tkBtnThemeChangeAllTheme];
            });
        };
        objc_setAssociatedObject(self, @selector(tkBtnThemeColorDic), tkBtnThemeColorDic, OBJC_ASSOCIATION_RETAIN);
    }
}

- (void)setTkThemeTitleColor:(nullable NSArray <UIColor*> *)colors forState:(UIControlState)state{
    [self tksaveThemeKey:tkThemetitleColor themeSourceArry:colors forState:state];
}

- (void)setTkThemeTitleShadowColor:(nullable NSArray <UIColor*> *)colors forState:(UIControlState)state{
    [self tksaveThemeKey:tkThemeTitleShadowColor themeSourceArry:colors forState:state];
}

- (void)setTkThemeImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state{
    [self tksaveThemeKey:tkThemeImage themeSourceArry:images forState:state];
}

- (void)setTkThemeBackgroundImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state{
    
    [self tksaveThemeKey:tkThemeBackgroundImage themeSourceArry:images forState:state];
}

- (void)tksaveThemeKey:(NSString*)saveKey themeSourceArry:(NSArray*)sourcearry  forState:(UIControlState)state{
    if (!self.tkBtnThemeColorDic) {
        self.tkBtnThemeColorDic = [[NSMutableDictionary alloc]init];
    }
    NSMutableDictionary *dicSource = [[NSMutableDictionary alloc]initWithDictionary:[self.tkBtnThemeColorDic valueForKey:saveKey]?:@{}];
    [dicSource setValue:sourcearry forKey:[TKThemeObject tkKeyString:state]];
    [self.tkBtnThemeColorDic setValue:dicSource forKey:saveKey];
    if (tkIsMainThread) {
        [self tkBtnThemeChangeAllTheme];
    }else{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self tkBtnThemeChangeAllTheme];
        });
    }
}

- (void)tkBtnThemeChangeAllTheme{
    NSArray  *arryThme = [self.tkBtnThemeColorDic allKeys];
    if ([arryThme containsObject:tkThemetitleColor]) {
        NSDictionary *TitleColorDic = [self.tkBtnThemeColorDic valueForKey:tkThemetitleColor];
        for (NSString *state in TitleColorDic.allKeys) {
            NSArray *colors =[TitleColorDic valueForKey:state];
            UIColor *color = [TKThemeObject tkThemeColors:colors];
            color?[self setTitleColor:color forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkThemeTitleShadowColor]){
        NSDictionary *TitleShadowColorDic = [self.tkBtnThemeColorDic valueForKey:tkThemeTitleShadowColor];
        for (NSString *state in TitleShadowColorDic.allKeys) {
            NSArray *colors =[TitleShadowColorDic valueForKey:state];
            UIColor *color = [TKThemeObject tkThemeColors:colors];
            colors?[self setTitleShadowColor:color forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkThemeImage]){
        NSDictionary *ThemeImageDic = [self.tkBtnThemeColorDic valueForKey:tkThemeImage];
        for (NSString *state in ThemeImageDic.allKeys) {
            NSArray *images =[ThemeImageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkThemeBackgroundImage]){
        NSDictionary *ThemeBackgroundImageDic = [self.tkBtnThemeColorDic valueForKey:tkThemeBackgroundImage];
        for (NSString *state in ThemeBackgroundImageDic.allKeys) {
            NSArray *images =[ThemeBackgroundImageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setBackgroundImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }else{
        //nil do
    }
}

@end
