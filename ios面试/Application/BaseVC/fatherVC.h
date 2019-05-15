
#import <UIKit/UIKit.h>
#import "NavigationController.h"
@interface fatherVC : UIViewController
@property(nonatomic,strong,readonly)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property(nonatomic ,strong)UILabel *tit;
@property(nonatomic ,strong)UIButton *backbut;
@property(nonatomic ,strong)UIImageView *backimg;
@property(nonatomic ,strong)UIView *titvi;

//-(void)showtxt:(NSString *)txtstr;
//-(void)startanimatin:(NSString *)text;
//-(void)stopanimation;
//-(void)makeacall:(NSString *)callnub;
//-(void)shake;
//-(void)callkefu;
/*这个是检测内存泄漏的工具pod 'MLeaksFinder'*/
@end
