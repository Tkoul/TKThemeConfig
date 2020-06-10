//
//  TKAppDelegate.m
//  TKThemeConfig
//
//  Created by Tkoul on 06/09/2020.
//  Copyright (c) 2020 Tkoul. All rights reserved.
//

#import "TKAppDelegate.h"
#import "TKDemoViewCtrl.h"
#import <TKThemeConfig/TKThemeConfig.h>
@implementation TKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //程序加载完毕 在其它组件含有UI元素前，优先设置主题 ，因为主题作用全局的UI
    //可以设置YES 也可设置NO  根据自己的项目自行选择
    [self changeThemeCofingFllowSystem:YES];
    
    UINavigationController *navRoot = [[UINavigationController alloc]initWithRootViewController:[[TKDemoViewCtrl alloc] init]];
    self.window.rootViewController = navRoot;
    return YES;
}
#pragma mark -- 程序加载完毕 在其它组件含有UI元素前，优先设置主题 ，因为主题作用全局的UI
- (void)changeThemeCofingFllowSystem:(BOOL)fllowSystemTheme{
    if (fllowSystemTheme) {
        //followSystemTheme 一旦设置YES themeIndex便失去作用 因为跟随系统变更。注释见TKThemeManager.h
        [TKThemeManager config].followSystemTheme=YES;
    }else{
        //followSystemTheme 一旦设置NO themeIndex起作用.注释见TKThemeManager.h
        [TKThemeManager config].followSystemTheme=NO;
        [TKThemeManager config].themeIndex =0;
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
