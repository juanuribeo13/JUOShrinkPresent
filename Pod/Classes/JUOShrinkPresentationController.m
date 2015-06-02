//
//  JUOShrinkPresentationController.m
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import "JUOShrinkPresentationController.h"

#define defaultTopSpace 40

@interface JUOShrinkPresentationController()

@property (strong, nonatomic) UIView *dimmingView;

@end

@implementation JUOShrinkPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
					   presentingViewController:(UIViewController *)presentingViewController {
	
	if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
		
		self.dimmingView = [[UIView alloc] init];
		self.dimmingView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
		
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)];
		[self.dimmingView addGestureRecognizer:tap];
	}
	
	return self;
}

- (void)dimmingViewTapped:(UIGestureRecognizer *)gesture {
	
	if (gesture.state == UIGestureRecognizerStateRecognized) {
		
		if (self.shrinkDelegate && [self.shrinkDelegate respondsToSelector:@selector(backViewTapped)]) {
			[self.shrinkDelegate backViewTapped];
		} else {
			[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
		}
	}
}

- (void)presentationTransitionWillBegin {
	
	self.dimmingView.frame = self.containerView.bounds;
	self.dimmingView.alpha = 0;
	
	[self.containerView insertSubview:self.dimmingView atIndex:0];
	
	if (self.presentedViewController.transitionCoordinator) {
		
		[self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
			
			self.dimmingView.alpha = 1;
			
		} completion:nil];
	} else {
		
		self.dimmingView.alpha = 1;
	}
}

- (void)dismissalTransitionWillBegin {
	
	if (self.presentedViewController.transitionCoordinator) {
		
		[self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
			
			self.dimmingView.alpha = 0;
			
		} completion:nil];
	} else {
		
		self.dimmingView.alpha = 0;
	}
}

- (CGRect)frameOfPresentedViewInContainerView {
	
	CGRect frame = CGRectZero;
	CGRect containerBounds = self.containerView.bounds;
	
	CGFloat topSpace;
	
	if (self.shrinkDelegate && [self.shrinkDelegate respondsToSelector:@selector(topSpace)]) {
		topSpace = [self.shrinkDelegate topSpace];
	} else {
		topSpace = defaultTopSpace;
	}
	
	frame.size = CGSizeMake(containerBounds.size.width, containerBounds.size.height - topSpace);
	frame.origin = CGPointMake(0, topSpace);
	
	return frame;
}

@end
