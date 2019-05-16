
#import "BaseAnimation.h"
#import "AnimationKuGou.h"
#import "AnimationDiffNavi.h"


#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kWidth [[UIScreen mainScreen] bounds].size.width

const static NSTimeInterval DefauleAnimationDuration = 0.6;

@interface BaseAnimation ()

@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign,readwrite)UINavigationControllerOperation transitionType;

@end


@implementation BaseAnimation
- (instancetype)initWithType:(UINavigationControllerOperation)transitionType Duration:(NSTimeInterval)duration animateType:(AnimateType)animaType
{
    if (animaType)
    {
        switch (animaType)
        {
                break;
            case AnimateTypeDiffNavi:
            {
                self = [[AnimationDiffNavi alloc]init];
            }
                break;
            case AnimateTypeKuGou:
            {
                self = [[AnimationKuGou alloc]init];
            }
                break;        
            default:
                break;
        }
    }
    else
    {
         self = [[AnimationDiffNavi alloc]init]; 
    }
    if (self)
    {
        self.duration       = duration;
        self.transitionType = transitionType;
    }
    return self;
}
+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType animateType:(AnimateType)animaType
{
    return [self transitionWithType:transitionType duration:DefauleAnimationDuration animateType:animaType];
}

+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType duration:(NSTimeInterval)duration animateType:(AnimateType)animaType
{
    return [self transitionWithType:transitionType duration:duration interactivePopTransition:nil animateType:animaType];
}

+ (instancetype)transitionWithType:(UINavigationControllerOperation)transitionType duration:(NSTimeInterval)duration interactivePopTransition:(UIPercentDrivenInteractiveTransition *)interactivePopTransition animateType:(AnimateType)animaType
{
    BaseAnimation *animation = [[self alloc]initWithType:transitionType Duration:duration animateType:animaType];
    animation.interactivePopTransition = interactivePopTransition;
    return animation;
}
- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext{}
- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext{}
- (void)pushEnded{}
- (void)popEnded{}

#pragma mark - UIViewControllerAnimationTransition
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.transitionType == UINavigationControllerOperationPush)
    {
        [self push:transitionContext];
    }
    else if (self.transitionType == UINavigationControllerOperationPop)
    {
        [self pop:transitionContext];
    }
}
- (void)animationEnded:(BOOL)transitionCompleted
{
    if (!transitionCompleted)
    {
        return;
    }
    if (self.transitionType == UINavigationControllerOperationPush)
    {
        [self pushEnded];
    }
    else if (self.transitionType == UINavigationControllerOperationPop)
    {
        [self popEnded];
    }
}
@end
