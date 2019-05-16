//
//  sureview.m
//  约我出行
//
//  Created by 高金才 on 2018/1/18.
//  Copyright © 2018年 ammmi. All rights reserved.
#import "sureview.h"
@implementation sureview
+(instancetype)showAlterinVC:(UIViewController *)VC withTitle:(NSString *)title andsure:(sureBlock)sure
{
    sureview *asurevi=[sureview new];
    asurevi .alB_block =^(){
        sure();
    };
    [asurevi showsureviInVC:VC andtext:title];
    return asurevi;   
}
+(instancetype)showsingleAlterinVC:(UIViewController *)VC withTitle:(NSString *)title andsingle:(singlesureBlock)singlesure
{
    sureview *asurevi=[sureview new];
    asurevi .alB_block =^(){
        singlesure ();
    };
    [asurevi showsingersureviInVC:VC andtext:title];
    return asurevi;
}
-(void)showsureviInVC:(UIViewController *)VC andtext:(NSString *)text
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelbut = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *surebut = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self .alB_block();
    }];
    [alert addAction:cancelbut];
    [alert addAction:surebut];
    [VC presentViewController:alert animated:YES completion:nil];
}
-(void)showsingersureviInVC:(UIViewController *)VC andtext:(NSString *)text
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *surebut = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self .alB_block();
    }];
    [alert addAction:surebut];
    [VC presentViewController:alert animated:YES completion:nil];
    
}
//这个是确定按钮在左边的、  用来暗示用户点击起来比较麻烦、

@end
