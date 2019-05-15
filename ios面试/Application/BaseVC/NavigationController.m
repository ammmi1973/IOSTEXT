

#import "NavigationController.h"
#import "BaseAnimation.h"
#import "fatherVC.h"
@interface NavigationController ()<UINavigationControllerDelegate>
@end
@implementation NavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    self .navigationBarHidden =YES;
    self.delegate = self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(BaseAnimation*) animationControlle
{
    return animationControlle.interactivePopTransition;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(fatherVC *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    if (fromVC.interactivePopTransition)
    {
        BaseAnimation *animation = [[BaseAnimation alloc]initWithType:operation Duration:0.6 animateType:self.animationType];
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        return animation; //手势
    }
    else
    {
        BaseAnimation *animation = [[BaseAnimation alloc]initWithType:operation Duration:0.6 animateType:self.animationType];
        return animation;//非手势
    }
}
@end
