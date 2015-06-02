//
//  JUOShrinkTransitioningDelegate.h
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import <UIKit/UIKit.h>

@protocol JUOShrinkDelegate <NSObject>

@optional
- (NSTimeInterval)transitionDuration;
- (CGFloat)shrinkScale;
- (CGFloat)topSpace;
- (UIColor *)presentedWindowColor;
/**
 *
 *	This method is called when the view that stays in the back is tapped,
 *	in case you don't implement it, the default action is to dismiss the
 *	presented ViewController
 *
 */
- (void)backViewTapped;

@end

@interface JUOShrinkTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) id<JUOShrinkDelegate> shrinkDelegate;

@end
