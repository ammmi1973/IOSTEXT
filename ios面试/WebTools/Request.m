//
//  Request.m
//  约我出行
//
//  Created by ywcx on 2018/5/30.
//  Copyright © 2018年 ammmi. All rights reserved.
//

#import "Request.h"
#import <AFNetworking/AFNetworking.h>

@implementation Request
static Request *_sharedIn = nil;
+ (id)defaultRequest
{
    @synchronized(self){
        if(_sharedIn == nil)
        {
            _sharedIn = [[self alloc] init];
        }
    }
    return _sharedIn;
}
-(void)postrequestWithURL:(NSString *)url andBody:(NSMutableDictionary *)body andBlock:(void (^)(NSDictionary *))block
{
    if ([modle getpassenger_id])
    {
        [body setObject:[modle getpassenger_id] forKey:@"passenger_id"];
        [body setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"token"][@"token"] forKey:@"token"];
    }
    AFHTTPSessionManager *mage=[AFHTTPSessionManager manager];
    [mage.requestSerializer setHTTPShouldHandleCookies:YES];
    mage.requestSerializer =[AFJSONRequestSerializer serializer];
    mage .responseSerializer =[AFHTTPResponseSerializer serializer];
    NSLog(@"请求url:%@-------------------------参数:%@",url,body);
    [mage POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"---这里是upload%@",uploadProgress);
    }
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
           NSMutableDictionary *postdic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
           NSLog(@"请求返回参数-------:%@",postdic);
           block(postdic);
       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           NSMutableDictionary *postdic =[NSMutableDictionary dictionary];
           [postdic setObject:@"10000" forKey:@"errorCode"];
           block (postdic);
           NSLog(@"他娘的肯定是连接失败嘛:%@",error);
       }];
}
-(void)getrequestWithURL:(NSString *)url andBlock:(void (^)(NSDictionary *))block
{
    AFHTTPSessionManager *mage=[AFHTTPSessionManager manager];
    [mage GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
         nil;
     }
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
          NSLog(@"这个------%@",responseObject);
          block (responseObject);
      }
      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSMutableDictionary *postdic =[NSMutableDictionary dictionary];
          [postdic setObject:@"10000" forKey:@"errorCode"];
          block (postdic);
      }];
    
    
}
@end
