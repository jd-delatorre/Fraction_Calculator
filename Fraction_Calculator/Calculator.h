//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by John De La Torre on 2/3/14.
//  Copyright (c) 2014 John De La Torre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject{
    Fraction *operand1;
    Fraction *operand2;
    Fraction *accumulator;
}

@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;

@end
