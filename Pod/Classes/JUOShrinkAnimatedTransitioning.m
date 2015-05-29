//
//  JUOShrinkAnimatedTransitioning.m
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import "JUOShrinkAnimatedTransitioning.h"

#define animationDuration 0.5
#define shrinkScale 0.93

@implementation JUOShrinkAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	return animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	
	BOOL isPresentation = self.isPresentation;
	
	if (isPresentation) {
		
		[[transitionContext containerView] addSubview:toVC.view];
	}
	
	UIViewController *backVC = isPresentation ? fromVC : toVC;
	UIViewController *foreVC = isPresentation ? toVC : fromVC;
	
	CGRect presentedFrame = [transitionContext finalFrameForViewController:foreVC];
	CGRect dismissedFrame = CGRectMake(presentedFrame.origin.x,
									   presentedFrame.origin.y + presentedFrame.size.height,
									   presentedFrame.size.width,
									   presentedFrame.size.height);
	
	CGRect initialFrame = isPresentation ? dismissedFrame : presentedFrame;
	CGRect finalFrame = isPresentation ? presentedFrame : dismissedFrame;
	
	foreVC.view.frame = initialFrame;
	
	[UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
		
		foreVC.view.frame = finalFrame;
		
		CGFloat scale = isPresentation ? shrinkScale : 1;
		backVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale);
		
	} completion:^(BOOL finished) {
		
		if (!isPresentation) {
			
			[fromVC.view removeFromSuperview];
		}
		
		[transitionContext completeTransition:YES];
	}];
}

@end
