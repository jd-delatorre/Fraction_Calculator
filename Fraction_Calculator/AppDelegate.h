//
//  AppDelegate.h
//  Fraction_Calculator
//
//  Created by John De La Torre on 2/3/14.
//  Copyright (c) 2014 John De La Torre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    IBOutlet UIWindow *window;
    IBOutlet ViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@end
