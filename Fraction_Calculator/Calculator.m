//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by John De La Torre on 2/3/14.
//  Copyright (c) 2014 John De La Torre. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;

-(id) init{
    self = [super init];
    
    operand1 = [[Fraction alloc]init];
    operand2 = [[Fraction alloc]init];
    accumulator = [[Fraction alloc]init];
    
    return self;
}

-(void) clear{
    if (accumulator) {
        accumulator.numerator = 0;
        accumulator.denominator = 0;
    }
}

-(Fraction *) performOperation:(char)op{
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 subtract: operand2];
        case '*':
            result = [operand1 multiply: operand2];
        case '/':
            result = [operand1 divide: operand2];
        default:
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
