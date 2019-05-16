//
//  ios-PCH.h
//  ios面试
//
//  Created by 高金才 on 2019/5/15.
//  Copyright © 2019 高金才. All rights reserved.
//

#ifndef ios_PCH_h
#define ios_PCH_h

#define w [UIScreen mainScreen].bounds.size.width
#define h [UIScreen mainScreen].bounds.size.height
#define  iPhoneX (w == 375.f && h == 812.f ? YES : NO)
#define  safeBottom   (iPhoneX ? 34.f : 0.f)
#define heightStatus [[UIApplication sharedApplication] statusBarFrame].size.height
#define nav_height (heightStatus+44)
#define viewRectmake CGRectMake(0, nav_height, w,h-nav_height-safeBottom)
#define view_height (h-nav_height-safeBottom)


#import "WebTools/webRequest.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "TxtHight.h"
#import "fatherVC.h"
#import "sureview.h"
#ifdef DEBUG

#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);

#endif
#endif /* ios_PCH_h */
