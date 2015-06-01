//
//  JUOShrinkAnimatedTransitioning.h
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import <UIKit/UIKit.h>

#import "JUOShrinkTransitioningDelegate.h"

@interface JUOShrinkAnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>

@property (weak, nonatomic) id<JUOShrinkDelegate> shrinkDelegate;

@property (nonatomic) BOOL isPresentation;

@end
