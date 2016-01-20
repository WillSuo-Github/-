//
//  PushTranstion.m
//  专场动画
//
//  Created by ws on 16/1/14.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "PushTranstion.h"

@implementation PushTranstion

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.8;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *formVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toVc];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    toVc.view.frame = CGRectOffset(finalFrameForVc, bounds.size.width, 0);
    [[transitionContext containerView] addSubview:toVc.view];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        formVc.view.alpha = 0.8;
        toVc.view.frame = finalFrameForVc;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
//        formVc.view.alpha = 0.1;
    }];
}

@end
