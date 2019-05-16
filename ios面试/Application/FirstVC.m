//
//  FirstVC.m
//  ios面试
//
//  Created by 高金才 on 2019/5/16.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "FirstVC.h"
#import "TabBarVC.h"
@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self .tit .text=@"首次进入";
    
    UILabel* txtlab =[[UILabel alloc]initWithFrame:CGRectMake(40, nav_height +100, w-80, 200)];
    txtlab .textColor =[UIColor blackColor];
    txtlab .font =[UIFont systemFontOfSize:20];
    txtlab .textAlignment=0;
    txtlab .numberOfLines =0;
    txtlab .text =@"您好、因为是首次加载、需要访问网络权限或者其他业务模型、所以有这样的提示,进入请点击屏幕";
    [self .view addSubview:txtlab];
    
    
    self .view .backgroundColor =[UIColor orangeColor];
    UIButton *NextBut =[[UIButton alloc]initWithFrame:CGRectMake(50, h-safeBottom-180, w-100, 60)];
    [NextBut setTitle:@"进   入" forState:0];
    [NextBut setTitleColor:[UIColor blackColor] forState:0];
    NextBut .titleLabel .font =[UIFont systemFontOfSize:16];
    NextBut .backgroundColor =[UIColor whiteColor];
    [self .view addSubview:NextBut];;
    [NextBut addTarget:self action:@selector(NextBut:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)NextBut:(id)sender
{
    CATransition *cat=[CATransition animation];
    cat .duration=0.3;
    cat .type=@"fade";
    [[UIApplication sharedApplication].keyWindow .layer addAnimation:cat forKey:nil];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[[TabBarVC alloc]init]];
    nav .navigationBarHidden=YES;
    nav.navigationBar.translucent = YES;
    [UIApplication sharedApplication].delegate .window .rootViewController=nav;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
