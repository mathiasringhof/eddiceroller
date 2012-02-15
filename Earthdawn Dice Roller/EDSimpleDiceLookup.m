//
//  EDSimpleDiceLookup.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDSimpleDiceLookup.h"

//#define DICE_FOR_STEP_AS_NUMBERS

@implementation EDSimpleDiceLookup

- (NSArray*) diceForStep: (NSInteger) step 
               withKarma: (BOOL) karma
{
    NSDictionary* lookup = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSArray arrayWithObject: [NSNumber numberWithInt:6]], [NSNumber numberWithInt:1], 
                            [NSArray arrayWithObject: [NSNumber numberWithInt:8]], [NSNumber numberWithInt:2],                             
                            nil];
    NSArray* dicesAsNumbers = [lookup objectForKey: [NSNumber numberWithInt:step]];
    NSMutableArray* result = [[NSMutableArray alloc] init];
    if (dicesAsNumbers) {
        for (NSNumber* numberOfSides in dicesAsNumbers) {
            EDDice* dice = [[EDDice alloc] initWithNoOfSides:numberOfSides];
            [result addObject:dice];
        }
    }
    if (karma) [result addObject:[[EDDice alloc] initWithNoOfSides:6]];
    return result;
}

- (NSArray*) diceForStep: (NSInteger) step
{
    return [self diceForStep:step withKarma:NO];
}

@end
