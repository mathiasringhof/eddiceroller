//
//  EDSimpleDiceLookup.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDSimpleDiceLookup.h"

//#define DICES_FOR_STEP

@implementation EDSimpleDiceLookup

- (NSArray*) diceForStep: (NSInteger) step 
               withKarma: (BOOL) karma
{
    NSDictionary* lookup = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:6 penalty:3]], [NSNumber numberWithInt:1], 
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:6 penalty:2]], [NSNumber numberWithInt:2],                             
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:6 penalty:1]], [NSNumber numberWithInt:3], 
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:6 penalty:0]], [NSNumber numberWithInt:4],                             
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:8 penalty:0]], [NSNumber numberWithInt:5],                             
                            nil];
    NSArray* dices = [lookup objectForKey: [NSNumber numberWithInt:step]];
    if (dices) {
        NSMutableArray* result = [NSMutableArray arrayWithArray:dices];
        if (karma) [result addObject:[EDDice diceWithNoOfSides:6]];
        return [result copy];
    } else return nil;
}

- (NSArray*) diceForStep: (NSInteger) step
{
    return [self diceForStep:step withKarma:NO];
}

- (NSInteger) maxSupportedStep
{
    return 5;
}

@end
