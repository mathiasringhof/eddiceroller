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

@synthesize noOfSides = _noOfSides;

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
    NSUInteger resultValue;
    NSInteger randomValue;
    do {
        randomValue = (arc4random() % self.noOfSides) + 1;
        resultValue = resultValue + randomValue;
    } while (randomValue == self.noOfSides);
    return [[EDDiceResult alloc] initWithResultValue:resultValue fromDice:self];
}

@end
