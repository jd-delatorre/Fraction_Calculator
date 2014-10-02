//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by John De La Torre on 2/3/14.
//  Copyright (c) 2014 John De La Torre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController{
    UILabel *display;
    char op;
    int currentNumber;
    NSMutableString *displayString;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
}

@property (strong, nonatomic) IBOutlet UILabel *display;
@property (strong, nonatomic) NSMutableString *displayString;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//numeric keys

-(IBAction)clickDigit:(id)sender;

//Arithmetic Operation keys

-(IBAction)clickPlus:(id)sender;
-(IBAction)clickMinus:(id)sender;
-(IBAction)clickMultiply:(id)sender;
-(IBAction)clickDivide:(id)sender;

//Misc Keys

-(IBAction)clickover:(id)sender;
-(IBAction)clickEquals:(id)sender;
-(IBAction)clickClear:(id)sender;

@end
