//
//  EDDiceResult.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceResult.h"
#import "EDDice.h"

@implementation EDDiceResult

@synthesize results = _results, thrownDice = _thrownDice;

#pragma mark Constructor
- (EDDiceResult*) initWithResults: (NSArray*) results 
                         fromDice: (EDDice*) thrownDice;
{
    self = [super init];
    if (self) {
        self.results = results;
        self.thrownDice = thrownDice;
    }
    return self;
}

#pragma mark Description
- (NSString*) description
{
    NSMutableString* returnValue = [[NSMutableString alloc] init];
    for (NSNumber* result in self.results) {
        if (returnValue.length != 0) [returnValue appendString:@" + "];
        [returnValue appendFormat:@"%d", result.intValue];
    }
    if (self.thrownDice.penalty > 0) [returnValue appendFormat:@" - %d", self.thrownDice.penalty];
    return [returnValue copy];
}

- (NSInteger) resultValue
{
    NSInteger returnValue = 0;
    for (NSNumber* result in self.results) {
        returnValue += result.intValue;
    }
    returnValue -= self.thrownDice.penalty;
    if (returnValue < 1) returnValue = 1;
    return returnValue;
}

@end
