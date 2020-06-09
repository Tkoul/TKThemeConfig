//
//  UIView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//

#import "UIView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "UIActivityIndicatorView+TKUpdate.h"
#import "UIButton+TKUpdate.h"
#import "UIImageView+TKUpdate.h"
#import "UILabel+TKUpdate.h"
#import "UIPageControl+TKUpdate.h"
#import "UIProgressView+TKUpdate.h"
#import "UISlider+TKUpdate.h"
#import "UIStepper+TKUpdate.h"
#import "UISwitch+TKUpdate.h"
#import "UITabBar+TKUpdate.h"
#import "UITableView+TKUpdate.h"
#import "UITextField+TKUpdate.h"
#import "UITextView+TKUpdate.h"
#import "TKThemeObject.h"
typedef BOOL (^tkThemeChange)(BOOL themeChange);
@implementation UIView (TKUpdate)

+ (void)load
{
    [TKThemeObject tkswizzledMethod:self methodOld:@selector(initWithCoder:) methodNew:@selector(tkswizzled_initWithCoder:)];
    [TKThemeObject tkswizzledMethod:self methodOld:@selector(initWithFrame:) methodNew:@selector(tkswizzled_initWithFrame:)];
}
- (instancetype)tkswizzled_initWithCoder:(NSCoder *)coder{
    [self tkThemeInItBlockConfig];
    return  [self tkswizzled_initWithCoder:coder];
}
- (instancetype)tkswizzled_initWithFrame:(CGRect)frame
{
    [self tkThemeInItBlockConfig];
    return  [self tkswizzled_initWithFrame:frame];
}
- (void)tkThemeInItBlockConfig{
    __weak typeof(self) weakSelf = self;
    [TKThemeManager config].tkThemeBlock(^BOOL(BOOL themeChange) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (themeChange&&strongSelf) {
            if ([strongSelf isMemberOfClass:[UILabel class]]){
                UILabel *theme = (UILabel*)strongSelf;
                theme.tkThemetextColors !=nil?theme.tkThemetextColors = theme.tkThemetextColors:nil;
                theme.tkThemeshadowColors !=nil?theme.tkThemeshadowColors = theme.tkThemeshadowColors:nil;
                theme.tkThemehighlightedTextColors !=nil?theme.tkThemehighlightedTextColors = theme.tkThemehighlightedTextColors:nil;
            }else if ([strongSelf isMemberOfClass:[UIButton class]]){
                UIButton *theme = (UIButton*)strongSelf;
                theme.tkThemetintColors!=nil?theme.tkThemetintColors = theme.tkThemetintColors:nil;
                theme.tkBtnThemeColorDic!=nil?theme.tkBtnThemeColorDic = theme.tkBtnThemeColorDic:nil;
                // NSLog(@"UIButton===%@",weakSelf.class);
            }else if ([strongSelf isMemberOfClass:[UIImageView class]]){
                UIImageView *theme = (UIImageView*)strongSelf;
                theme.tkThemeimages !=nil?theme.tkThemeimages =  theme.tkThemeimages:nil;
                theme.tkThemehightImages !=nil?theme.tkThemehightImages =  theme.tkThemehightImages:nil;
                theme.tkThemeanimationImages !=nil?theme.tkThemeanimationImages =  theme.tkThemeanimationImages:nil;
                theme.tkThemehighlightedAnimationImages !=nil?theme.tkThemehighlightedAnimationImages =  theme.tkThemehighlightedAnimationImages:nil;
                //  NSLog(@"UIImageView===%@",weakSelf.class);
            }else if ([strongSelf isMemberOfClass:[UIProgressView class]]){
                UIProgressView *theme = (UIProgressView*)strongSelf;
                theme.tkThemeProgressTintColors !=nil? theme.tkThemeProgressTintColors = theme.tkThemeProgressTintColors:nil;
                theme.tkThemeTrackTintColors !=nil? theme.tkThemeTrackTintColors = theme.tkThemeTrackTintColors:nil;
                theme.tkThemeProgressImages !=nil? theme.tkThemeProgressImages = theme.tkThemeProgressImages:nil;
                theme.tkThemeTrackImages !=nil? theme.tkThemeTrackImages = theme.tkThemeTrackImages:nil;
                // NSLog(@"UITextField===%@",weakSelf.class);
            }else if ([strongSelf isMemberOfClass:[UIPageControl class]]){
                UIPageControl *theme = (UIPageControl*)strongSelf;
                theme.tkThemePageIndicatorTintColors !=nil? theme.tkThemePageIndicatorTintColors =  theme.tkThemePageIndicatorTintColors:nil;
                theme.tkThemeCurrentPageIndicatorTintColors !=nil? theme.tkThemeCurrentPageIndicatorTintColors =  theme.tkThemeCurrentPageIndicatorTintColors:nil;
            }else if ([strongSelf isMemberOfClass:[UISlider class]]){
                UISlider *theme = (UISlider*)strongSelf;
                theme.tkThememinimumValueImage !=nil? theme.tkThememinimumValueImage =  theme.tkThememinimumValueImage:nil;
                theme.tkThememaximumValueImage !=nil? theme.tkThememaximumValueImage =  theme.tkThememaximumValueImage:nil;
                theme.tkThememinimumTrackTintColor !=nil? theme.tkThememinimumTrackTintColor =  theme.tkThememinimumTrackTintColor:nil;
                theme.tkThememaximumTrackTintColor !=nil? theme.tkThememaximumTrackTintColor =  theme.tkThememaximumTrackTintColor:nil;
                theme.tkThemethumbTintColor !=nil? theme.tkThemethumbTintColor =  theme.tkThemethumbTintColor:nil;
                theme.tkThemeImageDic !=nil? theme.tkThemeImageDic =  theme.tkThemeImageDic:nil;
            }else if ([strongSelf isMemberOfClass:[UIStepper class]]){
                UIStepper *theme = (UIStepper*)strongSelf;
                theme.tkThemeImageDic !=nil? theme.tkThemeImageDic = theme.tkThemeImageDic:nil;
            }else if ([strongSelf isMemberOfClass:[UISwitch class]]){
                UISwitch *theme = (UISwitch*)strongSelf;
                theme.tkThemeonTintColors!=nil? theme.tkThemeonTintColors = theme.tkThemeonTintColors:nil;
                theme.tkThemethumbTintColors !=nil? theme.tkThemethumbTintColors = theme.tkThemethumbTintColors:nil;
                theme.tkThemeonImages !=nil? theme.tkThemeonImages = theme.tkThemeonImages:nil;
                theme.tkThemeoffImages !=nil? theme.tkThemeoffImages = theme.tkThemeoffImages:nil;
            }else if ([strongSelf isMemberOfClass:[UITabBar class]]){
                UITabBar *theme = (UITabBar*)strongSelf;
                theme.tkThemebarTintColors !=nil? theme.tkThemebarTintColors = theme.tkThemebarTintColors:nil;
                if (@available(iOS 10.0, *)) {
                    theme.tkThemeunselectedItemTintColors !=nil? theme.tkThemeunselectedItemTintColors = theme.tkThemeunselectedItemTintColors:nil;
                } else {
                    // Fallback on earlier versions
                }
                theme.tkThemebackgroundImages !=nil? theme.tkThemebackgroundImages = theme.tkThemebackgroundImages:nil;
                theme.tkThemeselectionIndicatorImages !=nil? theme.tkThemeselectionIndicatorImages = theme.tkThemeselectionIndicatorImages:nil;
                theme.tkThemeshadowImages !=nil? theme.tkThemeshadowImages = theme.tkThemeshadowImages:nil;
            }else if ([strongSelf isMemberOfClass:[UIActivityIndicatorView class]]){
                UIActivityIndicatorView *theme = (UIActivityIndicatorView*)strongSelf;
                theme.tkThemecolors !=nil? theme.tkThemecolors = theme.tkThemecolors:nil;
            }else if ([strongSelf isMemberOfClass:[UITableView class]]){
                UITableView *theme = (UITableView*)strongSelf;
                theme.tkThemesectionIndexColors !=nil? theme.tkThemesectionIndexColors =theme.tkThemesectionIndexColors:nil;
                theme.tkThemesectionIndexBackgroundColors !=nil? theme.tkThemesectionIndexBackgroundColors =theme.tkThemesectionIndexBackgroundColors:nil;
                theme.tkThemesectionIndexTrackingBackgroundColors !=nil? theme.tkThemesectionIndexTrackingBackgroundColors =theme.tkThemesectionIndexTrackingBackgroundColors:nil;
                theme.tkThemeseparatorColors !=nil? theme.tkThemeseparatorColors =theme.tkThemeseparatorColors:nil;
            }else if ([strongSelf isMemberOfClass:[UITextField class]]){
                UITextField *theme = (UITextField*)strongSelf;
                theme.tkThemetextColors !=nil? theme.tkThemetextColors = theme.tkThemetextColors:nil;
                theme.tkThemebackgrounds !=nil? theme.tkThemebackgrounds = theme.tkThemebackgrounds:nil;
                theme.tkThemedisabledBackgrounds  !=nil? theme.tkThemedisabledBackgrounds = theme.tkThemedisabledBackgrounds:nil;
            }else if ([strongSelf isMemberOfClass:[UITextView class]]){
                UITextView *theme = (UITextView*)strongSelf;
                theme.tkThemetextColors !=nil? theme.tkThemetextColors = theme.tkThemetextColors:nil;
            }else{
                //do nothing
            }
            strongSelf.tkThemebackgroundColors!=nil? strongSelf.tkThemebackgroundColors = strongSelf.tkThemebackgroundColors:nil;
        }
        return strongSelf?NO:YES;
    });
}
- (NSArray<UIColor*>*)tkThemebackgroundColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemebackgroundColors:(NSArray<UIColor *> *)tkThemebackgroundColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color =[TKThemeObject tkThemeColors:tkThemebackgroundColors];
            color?[self setBackgroundColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color =[TKThemeObject tkThemeColors:tkThemebackgroundColors];
                color?[self setBackgroundColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemebackgroundColors), tkThemebackgroundColors, OBJC_ASSOCIATION_COPY);
    }
}

- (NSArray<UIColor*>*)tkThemetintColors{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemetintColors:(NSArray<UIColor *> *)tkThemetintColors{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIColor *color =[TKThemeObject tkThemeColors:tkThemetintColors];
            color?[self setTintColor:color]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIColor *color =[TKThemeObject tkThemeColors:tkThemetintColors];
                color?[self setTintColor:color]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemetintColors), tkThemetintColors, OBJC_ASSOCIATION_COPY);
    }
}

@end
