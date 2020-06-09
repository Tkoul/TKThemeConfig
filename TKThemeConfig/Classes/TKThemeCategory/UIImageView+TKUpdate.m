//
//  UIImageView+TKUpdate.m
//  Pods
//
//  Created by Tkoul on 2020/5/20.
//

#import "UIImageView+TKUpdate.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"
#import "TKThemeObject.h"
@implementation UIImageView (TKUpdate)
//tkThemeImages
- (NSArray <UIImage *>*)tkThemeimages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeimages:(NSArray<UIImage *> *)tkThemeimages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemeimages];
            image?[self setImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemeimages];
                image?[self setImage:image]:nil;
            });
        }
        objc_setAssociatedObject(self, @selector(tkThemeimages), tkThemeimages, OBJC_ASSOCIATION_COPY);
    }
}

//tkThemeHightImages
- (NSArray <UIImage *>*)tkThemehightImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemehightImages:(NSArray<UIImage *> *)tkThemehightImages{
    @synchronized (self) {
        if (tkIsMainThread) {
            UIImage *image = [TKThemeObject tkThemeImages:tkThemehightImages];
            image?[self setHighlightedImage:image]:nil;
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImage *image = [TKThemeObject tkThemeImages:tkThemehightImages];
                image?[self setHighlightedImage:image]:nil;
            });
        }
        
        objc_setAssociatedObject(self, @selector(tkThemehightImages), tkThemehightImages, OBJC_ASSOCIATION_COPY);
    }
}
//tkThemeanimationImages
- (NSArray <NSArray <UIImage*> *> *)tkThemeanimationImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}
- (void)setTkThemeanimationImages:(NSArray<NSArray<UIImage *> *> *)tkThemeanimationImages{
    @synchronized (self) {
        [self tkThemeanimationImagesInit:tkThemeanimationImages];
        objc_setAssociatedObject(self, @selector(tkThemeanimationImages), tkThemeanimationImages, OBJC_ASSOCIATION_COPY);
    }
}
- (void)tkThemeanimationImagesInit:(NSArray<NSArray<UIImage *> *> *)tkThemeanimationImages{
    if (tkThemeanimationImages.count==0) {
        TKUILog(@"设置图片主题数组为空，未能变更指定的索引主题");
        return;
    }else{
        NSUInteger index = [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue];
        if (tkThemeanimationImages.count>=index) {
            if (tkIsMainThread) {
                [self setAnimationImages:tkThemeanimationImages[index]];
            }else{
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self setAnimationImages:tkThemeanimationImages[index]];
                });
            }
        }else{
            TKUILog(@"设置主题的索引大于动画数组画图片的数组的长度,图片未能变更指定的索引主题");
            return;
        }
    }
    
}
//tkThemeanimationHightImages
- (NSArray <NSArray <UIImage*> *> *)tkThemehighlightedAnimationImages{
    @synchronized (self) {
        return objc_getAssociatedObject(self, _cmd);
    }
}

- (void)setTkThemehighlightedAnimationImages:(NSArray<NSArray<UIImage *> *> *)tkThemehighlightedAnimationImages{
    @synchronized (self) {
        [self tkThemeanimationHightImagesInit:tkThemehighlightedAnimationImages];
        objc_setAssociatedObject(self, @selector(tkThemehighlightedAnimationImages), tkThemehighlightedAnimationImages, OBJC_ASSOCIATION_COPY);
    }
}
- (void)tkThemeanimationHightImagesInit:(NSArray<NSArray<UIImage *> *> *)tkThemeanimationHightImagesInit{
    if (tkThemeanimationHightImagesInit.count==0) {
        TKUILog(@"设置动画数组画图片的数组主题数组为空，未能变更指定的索引主题");
        return;
    }else{
        NSUInteger index = [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue];
        if (tkThemeanimationHightImagesInit.count>=index) {
            if (tkIsMainThread) {
                [self setHighlightedAnimationImages:tkThemeanimationHightImagesInit[index]];
            }else{
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self setHighlightedAnimationImages:tkThemeanimationHightImagesInit[index]];
                });
            }
            
        }else{
            TKUILog(@"设置主题的索引大于动画数组画图片的数组的长度,图片未能变更指定的索引主题");
            return;
        }
    }
}

@end
