//
//  JUOShrinkTransitioningDelegate.m
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import "JUOShrinkTransitioningDelegate.h"
#import "JUOShrinkPresentationController.h"
#import "JUOShrinkAnimatedTransitioning.h"

@interface JUOShrinkTransitioningDelegate()

@property (strong, nonatomic) JUOShrinkAnimatedTransitioning *animationController;

@end

@implementation JUOShrinkTransitioningDelegate

- (instancetype)init {
	
	if (self = [super init]) {
		self.animationController = [[JUOShrinkAnimatedTransitioning alloc] init];
	}
	
	return self;
}

- (void)setShrinkDelegate:(id<JUOShrinkDelegate>)shrinkDelegate {
	
	_shrinkDelegate = shrinkDelegate;
	self.animationController.shrinkDelegate = shrinkDelegate;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
													  presentingViewController:(UIViewController *)presenting
														  sourceViewController:(UIViewController *)source {
	
	JUOShrinkPresentationController *presentationController = [[JUOShrinkPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
	presentationController.shrinkDelegate = self.shrinkDelegate;
	return presentationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
																  presentingController:(UIViewController *)presenting
																	  sourceController:(UIViewController *)source {
	
	self.animationController.isPresentation = YES;
	return self.animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
	
	self.animationController.isPresentation = NO;
	return self.animationController;
}

@end
