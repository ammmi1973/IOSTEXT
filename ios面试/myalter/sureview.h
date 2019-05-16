//
//  sureview.h
//  约我出行
//
//  Created by 高金才 on 2018/1/18.
//  Copyright © 2018年 ammmi. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void (^sureBlock)(void);
typedef void (^singlesureBlock)(void);
typedef void (^alsureBlock)(void);
typedef void (^alsureB)(void);

typedef void (^SelfBlock)(id);

@interface sureview : UIView
@property(copy,nonatomic) sureBlock sure_block;
@property(copy,nonatomic) singlesureBlock single_block;
@property(copy,nonatomic) alsureBlock alsure_block;
@property(copy,nonatomic) alsureB alB_block;


@property (copy,nonatomic) SelfBlock selfblock;


+(instancetype)showAlterinVC:(UIViewController *)VC withTitle:(NSString *)title andsure:(sureBlock)sure;
+(instancetype)showsingleAlterinVC:(UIViewController *)VC withTitle:(NSString *)title andsingle:(singlesureBlock)singlesure;


@end
