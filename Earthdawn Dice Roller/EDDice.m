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

#pragma mark Class methods
+ (EDDice*) diceWithNoOfSides: (NSInteger) noOfSides
{
    return [[EDDice alloc] initWithNoOfSides:noOfSides];
}

+ (EDDice*) diceWithNoOfSides: (NSInteger) noOfSides 
                      penalty: (NSInteger) penalty
{
    return [[EDDice alloc] initWithNoOfSides:noOfSides penalty:penalty];
}

#pragma mark Properties
@synthesize noOfSides = _noOfSides, penalty = _penalty, delegate = _delegate;

#pragma mark Constructors
- (EDDice*) initWithNoOfSides: (NSInteger) noOfSides
{
    self = [super init];
    if (self) {
        self.noOfSides = noOfSides;        
        self.penalty = 0;
    }
    return self;
}

- (EDDice*) initWithNoOfSides: (NSInteger) noOfSides 
                      penalty: (NSInteger) penalty
{
    self = [super init];
    if (self) {
        self.noOfSides = noOfSides;     
        self.penalty = penalty;
    }
    return self;
}

#pragma mark Methods
- (EDDiceResult*) roll
{
    NSInteger resultValue = 0;
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
