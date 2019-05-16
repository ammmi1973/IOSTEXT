//
//  modle.m
//  ios面试
//
//  Created by 高金才 on 2019/5/16.
//  Copyright © 2019 高金才. All rights reserved.
//

#import "modle.h"

@implementation modle
+(void)firstlog:(NSString *)logtag
{
    [[NSUserDefaults standardUserDefaults]setObject:logtag forKey:@"firstlog"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
+(BOOL)getfirtlog
{
    NSString *logstr=[[NSUserDefaults standardUserDefaults]objectForKey:@"firstlog"];
    if (logstr)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}
@end
