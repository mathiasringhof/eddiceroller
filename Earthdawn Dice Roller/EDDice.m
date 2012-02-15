//
//  EDDice.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDice.h"
#import "EDDiceResult.h"

@implementation EDDice

@synthesize noOfSides = _noOfSides, penalty = _penalty, delegate = _delegate;

- (EDDice*) initWithNoOfSides: (NSUInteger) noOfSides
{
    self = [super init];
    if (self) {
        self.noOfSides = noOfSides;        
        self.penalty = 0;
    }
    return self;
}

- (EDDice*) initWithNoOfSides: (NSUInteger) noOfSides 
                      penalty: (NSUInteger) penalty
{
    self = [super init];
    if (self) {
        self.noOfSides = noOfSides;     
        self.penalty = penalty;
    }
    return self;
}

- (EDDiceResult*) roll
{
    NSUInteger resultValue = 0;
    NSInteger randomValue = 0;
    do {
        if (self.delegate) {
            randomValue = [self.delegate generateRandomNumberFrom:1 to:self.noOfSides];
        } else {
            randomValue = (arc4random() % self.noOfSides) + 1;
        }
        resultValue = resultValue + randomValue;
    } while (randomValue == self.noOfSides);
    resultValue = resultValue - self.penalty;
    if (resultValue < 1) resultValue = 1;
    return [[EDDiceResult alloc] initWithResultValue:resultValue fromDice:self];
}

- (NSString*) description
{
    if (self.penalty > 0)
        return [NSString stringWithFormat:@"D%d - %d", self.noOfSides, self.penalty];
    else
        return [NSString stringWithFormat:@"D%d", self.noOfSides];
}

@end
