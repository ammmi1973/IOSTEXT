
#import "fatherVC.h"
@interface fatherVC ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end
@implementation fatherVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatcommonview];
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject)
    {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
        [self.view addGestureRecognizer:popRecognizer];
        popRecognizer.delegate = self;
    }
}
-(void)creatcommonview
{
    self .view .backgroundColor=[UIColor whiteColor];
    _titvi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, w, nav_height)];
    _titvi .backgroundColor=[UIColor whiteColor];
    
    _tit=[[UILabel alloc]initWithFrame:CGRectMake(50, heightStatus, w-100, 40)];
    _tit .textColor=[UIColor blackColor];
    _tit .textAlignment=1;
//   _tit .font =[];
    [_titvi addSubview:_tit];
    _backbut=[[UIButton alloc]initWithFrame:CGRectMake(5, heightStatus, 40, 40)];
    [_backbut setImage:[UIImage imageNamed:@"back"] forState:0];
    
    _backimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, w,h)];
    _backimg .image =[UIImage imageNamed:@"back.jpg"];
    [self .view addSubview:_backimg];
    [_titvi addSubview:_backbut];
    [self .view addSubview:_titvi];
    [_backbut addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    if ([self.navigationController.viewControllers indexOfObject:self] == 0)
    {
        self .backbut .hidden =YES;
    }
    
}
- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    progress = MIN(1.0, MAX(0.0, progress));
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (progress > 0.25)
        {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else
        {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    if ([gestureRecognizer velocityInView:self.view].x <0||self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    return YES;
}
-(void)back
{
    [self .navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
