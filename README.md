# JUOShrinkPresent

[![CI Status](http://img.shields.io/travis/Juan Uribe/JUOShrinkPresent.svg?style=flat)](https://travis-ci.org/Juan Uribe/JUOShrinkPresent)
[![Version](https://img.shields.io/cocoapods/v/JUOShrinkPresent.svg?style=flat)](http://cocoapods.org/pods/JUOShrinkPresent)
[![License](https://img.shields.io/cocoapods/l/JUOShrinkPresent.svg?style=flat)](http://cocoapods.org/pods/JUOShrinkPresent)
[![Platform](https://img.shields.io/cocoapods/p/JUOShrinkPresent.svg?style=flat)](http://cocoapods.org/pods/JUOShrinkPresent)

## Installation

JUOShrinkPresent is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JUOShrinkPresent', '~> 0.1.0'
```

## Usage

After installing, you just need to have an instance of `JUOShrinkTransitioningDelegate` and set it as the `transitioningDelegate` for your controller.

```objective-c
@property (strong, nonatomic) JUOShrinkTransitioningDelegate *shrinkTransitioningDelegate;
...
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	
	if ([segue.identifier isEqualToString:@"presentViewController"]) {
		UIViewController *toVC = segue.destinationViewController;
		toVC.modalPresentationStyle = UIModalPresentationCustom;
		toVC.transitioningDelegate = self.shrinkTransitioningDelegate;
	}
}
```

If you want to customize the transition duration, shrink scale and other things you can use the `JUOShrinkDelegate`.

For more details go check the example project. To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Juan Uribe, juanuribeo13@gmail.com.co

## License

JUOShrinkPresent is available under the MIT license. See the LICENSE file for more info.
