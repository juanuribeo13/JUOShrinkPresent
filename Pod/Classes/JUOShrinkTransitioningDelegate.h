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
- (CGColorRef)presentedWindowColor;

@end

@interface JUOShrinkTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) id<JUOShrinkDelegate> shrinkDelegate;

@end
