//
//  JUOShrinkAnimatedTransitioning.m
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import "JUOShrinkAnimatedTransitioning.h"

#define defaultAnimationDuration 0.5
#define defaultShrinkScale 0.93

@interface JUOShrinkAnimatedTransitioning()

@property CGColorRef windowColor;

@end


@implementation JUOShrinkAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
	
	if (self.shrinkDelegate && [self.shrinkDelegate respondsToSelector:@selector(transitionDuration)]) {
		
		return [self.shrinkDelegate transitionDuration];
	}
	
	return defaultAnimationDuration;
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
		
		CGFloat shrinkScale;
		
		if (self.shrinkDelegate && [self.shrinkDelegate respondsToSelector:@selector(shrinkScale)]) {
			shrinkScale = [self.shrinkDelegate shrinkScale];
		} else {
			shrinkScale = defaultShrinkScale;
		}
		
		CGFloat scale = isPresentation ? shrinkScale : 1;
		backVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale);
		
		[self changeWindowBackgroundIfNeeded];
		
	} completion:^(BOOL finished) {
		
		if (!isPresentation) {
			
			[fromVC.view removeFromSuperview];
		}
		
		[transitionContext completeTransition:YES];
	}];
}

- (void)changeWindowBackgroundIfNeeded {
	
	if (self.shrinkDelegate && [self.shrinkDelegate respondsToSelector:@selector(presentedWindowColor)]) {
		
		id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
		
		if (self.isPresentation) {
			
			self.windowColor = [appDelegate window].layer.backgroundColor;
			[appDelegate window].layer.backgroundColor = [self.shrinkDelegate presentedWindowColor].CGColor;
		} else {
			[appDelegate window].layer.backgroundColor = self.windowColor;
		}
	}
}

@end
