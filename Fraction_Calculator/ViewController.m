//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by John De La Torre on 2/3/14.
//  Copyright (c) 2014 John De La Torre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display, displayString;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    firstOperand = YES;
    isNumerator = YES;
    self.displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) processDigit: (int) digit{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    [display setText:displayString];
}
-(IBAction)clickDigit:(id)sender{
    int digit = [sender tag];
    
    [self processDigit:digit];
}


-(void) processOp: (char) theOp{
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" x ";
            break;
        case '/':
            opStr = @" ÷ ";
            break;
            
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    [display setText:displayString];
}
-(void) storeFracPart{
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if(isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    
    else{
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction)clickover:(id)sender{
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    [display setText: displayString];
}

-(IBAction)clickPlus:(id)sender{
    [self processOp:'+'];
}
-(IBAction)clickMinus:(id)sender{
    [self processOp:'-'];
}
-(IBAction)clickMultiply:(id)sender{
    [self processOp:'*'];
}
-(IBAction)clickDivide:(id)sender{
    [self processOp:'-'];
}


-(IBAction)clickEquals:(id)sender{
    [self storeFracPart];
    [myCalculator performOperation:op];
    [displayString appendString:@ " = " ];
    [displayString appendString:[myCalculator.accumulator convertToString]];
    [display setText:displayString];
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString:@""];
}
-(IBAction)clickClear:(id)sender{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@" "];
    [display setText:displayString];
}

//Misc Keys



@end



































