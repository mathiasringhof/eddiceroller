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

@synthesize noOfSides = _noOfSides, delegate = _delegate;

- (EDDice*) initWithNoOfSides: (NSUInteger) noOfSides
{
    self = [super init];
    if (self) {
        self.noOfSides = noOfSides;        
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
    return [[EDDiceResult alloc] initWithResultValue:resultValue fromDice:self];
}

@end
