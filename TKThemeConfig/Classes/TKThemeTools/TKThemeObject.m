//
//  TKThemeObject.m
//  Pods
//
//  Created by Tkoul on 2020/5/26.
//

#import "TKThemeObject.h"
#import <objc/runtime.h>
#import "TKThemeManager.h"

@implementation TKThemeObject
+ (void)tkswizzledMethod:(Class)obClass methodOld:(SEL)oldSelect methodNew:(SEL)newSelect{
    Method newMethod = class_getInstanceMethod(obClass, newSelect);
    Method oldMethod = class_getInstanceMethod(obClass, oldSelect);
    BOOL addedMethod = class_addMethod(obClass,oldSelect,method_getImplementation(newMethod),method_getTypeEncoding(newMethod));
    if(addedMethod){
        class_replaceMethod(obClass,
                            newSelect,
                            method_getImplementation(oldMethod),
                            method_getTypeEncoding(oldMethod));
    }else{
        method_exchangeImplementations(newMethod, oldMethod);
    }
    
}
+ (void)tkswizzledClassMethod:(Class)obClass methodOld:(SEL)oldSelect methodNew:(SEL)newSelect{
    Method newMethod = class_getClassMethod(obClass, newSelect);
    Method oldMethod = class_getClassMethod(obClass, oldSelect);
    BOOL hasMethod = class_addMethod(obClass,oldSelect,method_getImplementation(newMethod),method_getTypeEncoding(newMethod));
    if (hasMethod) {
        class_replaceMethod(obClass,
                            newSelect,
                            method_getImplementation(newMethod),
                            method_getTypeEncoding(newMethod));
    }else{
        method_exchangeImplementations(newMethod, oldMethod);
    }
}

+ (NSString *)tkKeyString:(UIControlState)keyState{
    switch (keyState) {
        case UIControlStateNormal:
            return tkUIControlStateNormal;
            break;
        case UIControlStateHighlighted:
            return tkUIControlStateHighlighted;
            break;
        case UIControlStateDisabled:
            return tkUIControlStateDisabled;
            break;
        case UIControlStateSelected:
            return tkUIControlStateSelected;
            break;
        case UIControlStateFocused:
            return tkUIControlStateFocused;
            break;
        case UIControlStateApplication:
            return tkUIControlStateApplication;
            break;
        case UIControlStateReserved:
            return tkUIControlStateReserved;
            break;
            
        default:
            break;
    }
}

+ (UIControlState )tkControlState:(NSString*)keyStr{
    if ([keyStr isEqualToString:tkUIControlStateNormal]) {
        return  UIControlStateNormal;
    }else if ([keyStr isEqualToString:tkUIControlStateHighlighted]){
        return UIControlStateHighlighted;
    }else if ([keyStr isEqualToString:tkUIControlStateDisabled]){
        return UIControlStateDisabled;
    }else if ([keyStr isEqualToString:tkUIControlStateSelected]){
        return UIControlStateSelected;
    }else if ([keyStr isEqualToString:tkUIControlStateFocused]){
        if (@available(iOS 9.0, *)) {
            return UIControlStateFocused;
        } else {
            // Fallback on earlier versions
            return UIControlStateNormal;
        }
    }else if ([keyStr isEqualToString:tkUIControlStateApplication]){
        return UIControlStateApplication;
    }else if ([keyStr isEqualToString:tkUIControlStateReserved]){
        return UIControlStateReserved;
    }else{
        return  UIControlStateNormal;
    }
}
+ (UIColor*)tkThemeColors:(nullable NSArray <UIColor*> *)colors{
    if (colors.count==0) {
        TKUILog(@"设置颜色主题数组为空，未能变更指定的索引主题");
        return nil;
    }else{
        NSUInteger index = [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue];
        if (colors.count>index) {
            return colors[index];
        }else{
            TKUILog(@"设置主题的索引大于颜色数组的长度,颜色未能变更指定的索引主题");
            return nil;
        }
    }
}
+ (UIImage*)tkThemeImages:(nullable NSArray <UIImage*> *)images{
    if (images.count==0) {
        TKUILog(@"设置图片主题数组为空，未能变更指定的索引主题");
        return nil;
    }else{
        NSUInteger index = [[[TKThemeManager config] valueForKey:tkThemenCofigIndex] integerValue];
        if (images.count>index) {
            return images[index];
        }else{
            TKUILog(@"设置主题的索引大于图片数组的长度,图片未能变更指定的索引主题");
            return nil;
        }
    }
}
+ (NSMutableDictionary*)tksaveThemeoldThem:(NSDictionary*)oldThemeDic newKey:(NSString*)saveKey themeSourceArry:(NSArray*)sourcearry  forState:(UIControlState)state{
    NSMutableDictionary *tkThemeDic = [[NSMutableDictionary alloc]initWithDictionary:oldThemeDic?:@{}];
    NSMutableDictionary *dicSource = [[NSMutableDictionary alloc]initWithDictionary:[tkThemeDic valueForKey:saveKey]?:@{}];
    [dicSource setValue:sourcearry forKey:[TKThemeObject tkKeyString:state]];
    [tkThemeDic setValue:dicSource forKey:saveKey];
    return tkThemeDic;
};
+(void)tkPrintWaringLog:(nullable const char *)file line:(int)line func:(nonnull const char *)func reason:(NSString*)reason{
//    NSString *fileString = [NSString stringWithFormat:@"%s", file];
//    NSString *funcString = [NSString stringWithFormat:@"%s", func];
//    NSString *defaultString = [NSString stringWithFormat:@"%@ \n| %@:%@\n reason:%@",fileString ,funcString, @(line),reason];
    NSLog(@"waring:%@",reason);
}
@end
