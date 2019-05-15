//
//  ViewController.m
//  wedding
//
//  Created by 高金才 on 2019/3/8.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "TabBarVC.h"
#import "LogVC.h"
#import "MyVc.h"
#import "MainVc.h"
#import "NewVc.h"
#import "AppointMentVc.h"
@interface TabBarVC ()
@end
@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVC:  [MainVc new] title:@"首页" imageMainName:@"shouye"];
    [self addChildVC:  [NewVc new] title:@"消息" imageMainName:@"shouye"];
    [self addChildVC:  [AppointMentVc new] title:@"预约" imageMainName:@"shouye"];
    [self addChildVC:  [MyVc new] title:@"我的" imageMainName:@"shouye"];
    
}
- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title imageMainName:(NSString *)imageMainName
{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:childVC];
    [nav setNavigationBarHidden:YES];
    nav .tabBarItem .title =title;
    
    NSString *imageName = [NSString stringWithFormat:@"tab_%@",imageMainName];
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    NSString *selectedImageName = [NSString stringWithFormat:@"tab_%@_hlight",imageMainName];
    
    
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [nav.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [nav.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
  
    [self addChildViewController:nav];
    
}
@end
