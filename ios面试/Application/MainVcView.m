//
//  MainVcView.m
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "MainVcView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@implementation MainVcView
-(instancetype)init
{
    self =[super init];
    if (self)
    {
        self .frame =CGRectMake(0, nav_height, w, w*3/5);
    }
    return self;
}

@end
