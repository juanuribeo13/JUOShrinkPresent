//
//  JUOPresentedViewController.m
//  JUOShrinkPresent
//
//  Created by Juan Alberto Uribe Otero on 5/29/15.
//  Copyright (c) 2015 Juan Uribe. All rights reserved.
//

#import "JUOPresentedViewController.h"

@interface JUOPresentedViewController ()

@end

@implementation JUOPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)dismissPressed:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
