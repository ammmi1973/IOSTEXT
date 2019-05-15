
#import <Foundation/Foundation.h>
@interface Request : NSObject
+ (Request *)defaultRequest;
-(void)postrequestWithURL:(NSString *)url andBody:(NSMutableDictionary *)body andBlock:(void (^)(NSDictionary *postdic))block;

-(void)getrequestWithURL:(NSString *)url andBlock:(void (^)(NSDictionary *getdic))block;


-(void)uploadImageWithURL:(NSString *)url andImage:(NSData *)imagedata andBlock:(void (^)(NSDictionary *seccesdic))block;
@end
