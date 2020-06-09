//
//  UIStepper+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "UIStepper+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
static NSString *tkBackgroundImage = @"tkBackgroundImage";
static NSString *tkDividerImage = @"tkDividerImage";
static NSString *tkIncrementImage = @"tkIncrementImage";
static NSString *tkDecrementImage = @"tkDecrementImage";
@implementation UIStepper (TKUpdate)
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
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self tkSliderThemeChangeAllTheme];
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemeImageDic), tkThemeImageDic, OBJC_ASSOCIATION_RETAIN);
    }
}
- (void)tkThemesetBackgroundImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state {
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkBackgroundImage themeSourceArry:images forState:state];
}
- (void)tkThemesetDividerImage:(nullable NSArray <UIImage*> *)images forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState {
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkDividerImage themeSourceArry:images forState:leftState];
}

// the glyph image for the plus/increase button
- (void)tkThemesetIncrementImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state {
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:tkIncrementImage themeSourceArry:images forState:state];
}

// the glyph image for the minus/decrease button
- (void)tkThemesetDecrementImage:(nullable NSArray <UIImage*> *)images forState:(UIControlState)state {
    self.tkThemeImageDic = [TKThemeObject tksaveThemeoldThem:self.tkThemeImageDic newKey:@"DecrementImage" themeSourceArry:images forState:state];
}
- (void)tkSliderThemeChangeAllTheme{
    NSArray  *arryThme = [self.tkThemeImageDic allKeys];
    if ([arryThme containsObject:tkBackgroundImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkBackgroundImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setBackgroundImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkDividerImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkDividerImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setDividerImage:image forLeftSegmentState:[TKThemeObject tkControlState:state] rightSegmentState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkIncrementImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkIncrementImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setIncrementImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
    if ([arryThme containsObject:tkDecrementImage]) {
        NSDictionary *imageDic = [self.tkThemeImageDic valueForKey:tkDecrementImage];
        for (NSString *state in imageDic.allKeys) {
            NSArray *images =[imageDic valueForKey:state];
            UIImage *image = [TKThemeObject tkThemeImages:images];
            image?[self setDecrementImage:image forState:[TKThemeObject tkControlState:state]]:nil;
        }
    }
}
@end
