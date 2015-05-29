//
//  JUORootViewController.m
//  JUOShrinkPresent
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//  Copyright (c) 2015 Juan Uribe. All rights reserved.
//

#import "JUORootViewController.h"
#import <JUOShrinkPresent/JUOShrinkTransitioningDelegate.h>

@interface JUORootViewController ()

@property (strong, nonatomic) JUOShrinkTransitioningDelegate *shrinkTransitioningDelegate;

@end

@implementation JUORootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.shrinkTransitioningDelegate = [[JUOShrinkTransitioningDelegate alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([segue.identifier isEqualToString:@"presentViewController"]) {
		UIViewController *toVC = segue.destinationViewController;
		toVC.modalPresentationStyle = UIModalPresentationCustom;
		toVC.transitioningDelegate = self.shrinkTransitioningDelegate;
	}
}

@end
