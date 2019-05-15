
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
          NSLog(@"这个get获取到的数据%@",responseObject);
          block (responseObject);
      }
      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSMutableDictionary *getdic =[NSMutableDictionary dictionary];
          [getdic setObject:@"10000" forKey:@"errorCode"];
          block (getdic);
      }];
    
    
}

-(void)uploadImageWithURL:(NSString *)url andImage:(NSData *)imagedata andBlock:(void (^)(NSDictionary *))block
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //[manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];

    NSData *imgdata = imagedata;
    NSLog(@"-----iiiiiimg%@",url);

    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat   = @"YYYY-MM-dd-hh:mm:ss:SSS";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        [formData appendPartWithFileData:imgdata name:@"mfile" fileName:fileName mimeType:@"image/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *errmsg = [responseObject objectForKey:@"errmsg"];
//        NSString *mediaID = [responseObject objectForKey:@"mediaid"];
//
//        if (mediaID && [errmsg isEqualToString:@"ok"]) {
//            block(responseObject);
//            NSLog(@"这里是图片上传的效果")
//        }

        NSLog(@"这里是上传成功过过过过过过过过%@",responseObject);
        
         block(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
        block(nil);
    }];
    
    
}
@end
