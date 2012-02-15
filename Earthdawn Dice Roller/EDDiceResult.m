//
//  EDDiceResult.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceResult.h"

@implementation EDDiceResult

@synthesize resultValue = _resultValue, thrownDice = _thrownDice;

#pragma mark Constructor
- (EDDiceResult*) initWithResultValue: (NSInteger)resultValue 
                             fromDice: (EDDice*) thrownDice;
{
    self = [super init];
    if (self) {
        self.resultValue = resultValue;
    }
    return self;
}

#pragma mark Description
- (NSString*) description
{
    if (self.resultValue > self.thrownDice.noOfSides) {
        NSInteger divResult = self.resultValue / self.thrownDice.noOfSides;
        NSMutableString* description = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < divResult; i++) {
            [description appendFormat:@"%d + ", self.thrownDice.noOfSides];
        }
        [description appendFormat:@"%d", self.resultValue - (self.thrownDice.noOfSides * divResult)];
        return [description copy];
    } else {
        return [NSString stringWithFormat:@"%d", self.resultValue];
    }
}

@end
