
#import <Foundation/Foundation.h>
@interface Request : NSObject
+ (Request *)defaultRequest;
-(void)postrequestWithURL:(NSString *)url andBody:(NSMutableDictionary *)body andBlock:(void (^)(NSDictionary *postdic))block;

-(void)getrequestWithURL:(NSString *)url andBlock:(void (^)(NSDictionary *postdic))block;
@end
