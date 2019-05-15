#import "webRequest.h"
#import "Requestheader.h"
@implementation webRequest
static webRequest *_sharedIn = nil;
+ (instancetype)Manager
{
    @synchronized(self){
        if(_sharedIn == nil)
        {
            _sharedIn = [[self alloc] init];
        }
    }
    return _sharedIn;
}
#pragma mark 这里是请求数据；
-(void)postRequestWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@",Url];
    
    [[Request defaultRequest]postrequestWithURL:url andBody:Body andBlock:^(NSDictionary *postdic){
        if (completed)
        {
            completed(postdic);
        }
    }];
}

-(void)GetRequestandComplet:(completed)completed
{
    
     NSString *url=[NSString stringWithFormat:@"%@",Url];
    [[Request defaultRequest]getrequestWithURL:url andBlock:^(NSDictionary *getdic) {
        
        if (completed)
        {
            completed(getdic);
        }
    }];
    
}
-(void)UpdataImgRequestImgaData:(NSData *)imgadata andComplet:(completed)completed
{
    NSString *url=[NSString stringWithFormat:@"%@",UpUrl];
    
    [[Request defaultRequest]uploadImageWithURL:url andImage:imgadata andBlock:^(NSDictionary *seccesdic) {
        if (completed)
        {
            completed(seccesdic);
        }
        
    }];
}

@end
