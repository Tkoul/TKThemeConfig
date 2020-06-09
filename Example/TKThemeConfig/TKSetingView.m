//
//  TKSetingView.m
//  TKThemeConfig_Example
//
//  Created by Tkoul on 2020/5/20.
//  Copyright © 2020 Tkoul. All rights reserved.
//

#import "TKSetingView.h"
#import <TKThemeConfig/TKThemeConfig.h>
@implementation TKSetingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tkThemebackgroundColors = @[[[UIColor blackColor] colorWithAlphaComponent:0.8],[[UIColor cyanColor] colorWithAlphaComponent:0.8]];
        
        [self creteSubViews];
    }
    return self;
}

- (void)creteSubViews{
    UILabel *lableSet = [[UILabel alloc]initWithFrame:CGRectMake(30, 80, 200, 40)];
    [lableSet setText:@"是否跟随系统暗黑模式:"];
    [lableSet setTkThemetextColors:@[UIColor.redColor,UIColor.blackColor]];
    [self addSubview:lableSet];
    
    UIButton *switchShow = [[UIButton alloc]initWithFrame:CGRectMake(230, 80, 95, 40)];
    [switchShow addTarget:self action:@selector(switchThemFllowSystem:) forControlEvents:UIControlEventTouchUpInside];
    if (TKThemeManager.config.followSystemTheme) {
         [switchShow setBackgroundImage:[UIImage imageNamed:@"auto_bid_on_icon.png"] forState:UIControlStateNormal];
    }else{
        [switchShow setBackgroundImage:[UIImage imageNamed:@"auto_bid_off.png"] forState:UIControlStateNormal];
    }
   
    [self addSubview:switchShow];
    
    themeBtnArry = [[NSMutableArray alloc]init];
    for (int i=0; i<2; i++) {
        UILabel *lableSetS = [[UILabel alloc]initWithFrame:CGRectMake(60+150*i, 160, 120, 40)];
        [lableSetS setText:[NSString stringWithFormat:@"选择主题 %d",i]];
        [lableSetS setTextAlignment:NSTextAlignmentCenter];
        [lableSetS setTkThemetextColors:@[UIColor.redColor,UIColor.blackColor]];
        [self addSubview:lableSetS];
        UIButton *chosseTheme = [[UIButton alloc]initWithFrame:CGRectMake(230+50*i, 160, 40, 40)];
        chosseTheme.tag = i;
        chosseTheme.center = CGPointMake(lableSetS.center.x, lableSetS.center.y+60);
        [chosseTheme addTarget:self action:@selector(chosseTheme:) forControlEvents:UIControlEventTouchUpInside];
        if (TKThemeManager.config.themeIndex==i) {
            [chosseTheme setTkThemeBackgroundImage:@[[UIImage imageNamed:@"choseTheme.png"],[UIImage imageNamed:@"choseThemeS.png"]] forState:UIControlStateNormal];
        }else{
            [chosseTheme setTkThemeBackgroundImage:@[[UIImage imageNamed:@"choseThemeN.png"],[UIImage imageNamed:@"choseThemeSN.png"]] forState:UIControlStateNormal];
        }
        [themeBtnArry addObject:chosseTheme];
        [self addSubview:chosseTheme];
    }
    
    
    UIButton *closeShow = [[UIButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width, 40)];
    [closeShow addTarget:self action:@selector(closeShowBtn) forControlEvents:UIControlEventTouchUpInside];
    [closeShow setTkThemebackgroundColors:@[UIColor.redColor,UIColor.orangeColor]];
    [closeShow setTitle:@"关闭设置界面" forState:UIControlStateNormal];
    [self addSubview:closeShow];
}

- (void)switchThemFllowSystem:(UIButton*)sender{
    if ([[sender backgroundImageForState:UIControlStateNormal]isEqual:[UIImage imageNamed:@"auto_bid_on_icon.png"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"auto_bid_off.png"] forState:UIControlStateNormal];
        [TKThemeManager config].followSystemTheme = NO;
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"auto_bid_on_icon.png"] forState:UIControlStateNormal];
        [TKThemeManager config].followSystemTheme = YES;
    }
    [self.subviews  makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self creteSubViews];
}
- (void)chosseTheme:(UIButton*)sender{
    if (TKThemeManager.config.followSystemTheme) {
        NSLog(@"目前为跟随系统暗黑模式状态，主题不可选");
        return;
    }
    for (UIButton *btn in themeBtnArry) {
        if (btn==sender) {
            [btn setTkThemeBackgroundImage:@[[UIImage imageNamed:@"choseTheme.png"],[UIImage imageNamed:@"choseThemeS.png"]] forState:UIControlStateNormal];
            
        }else{
            [btn setTkThemeBackgroundImage:@[[UIImage imageNamed:@"choseThemeN.png"],[UIImage imageNamed:@"choseThemeSN.png"]] forState:UIControlStateNormal];
        }
    }
    [TKThemeManager config].themeIndex = sender.tag;
}

- (void)closeShowBtn{
    
    [self removeFromSuperview];
}

- (void)dealloc{
    NSLog(@"JDCNSetingView  dealloc");
}

@end
