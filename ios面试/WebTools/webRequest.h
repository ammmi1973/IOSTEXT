

#import <Foundation/Foundation.h>
#import "Request.h"
typedef void(^completed) (NSDictionary *postdic);

@interface webRequest : NSObject

+ (webRequest *)Manager;

-(void)postRequestWithBoDy:(NSMutableDictionary *)Body andcompleted:(completed)completed;

-(void)GetRequestandComplet:(completed)completed;


-(void)UpdataImgRequestImgaData:(NSData *)imgadata andComplet:(completed)completed;



@end
