//
//  JUOShrinkPresentationController.h
//  Pods
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//
//

#import <UIKit/UIKit.h>

#import "JUOShrinkTransitioningDelegate.h"

@interface JUOShrinkPresentationController : UIPresentationController

@property (weak, nonatomic) id<JUOShrinkDelegate> shrinkDelegate;

@end
