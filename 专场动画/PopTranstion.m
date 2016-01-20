//
//  PopTranstion.m
//  专场动画
//
//  Created by ws on 16/1/15.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "PopTranstion.h"

@implementation PopTranstion

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.8;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    CGRect bounds = [UIScreen mainScreen].bounds;
    toVc.view.frame = CGRectOffset(finalFrame, -bounds.size.width, 0);
    [[transitionContext containerView] addSubview:toVc.view];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
