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
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:6]], [NSNumber numberWithInt:4],                             
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:8]], [NSNumber numberWithInt:5],                             
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:10]], [NSNumber numberWithInt:6],
                            [NSArray arrayWithObject: [EDDice diceWithNoOfSides:12]], [NSNumber numberWithInt:7],
                            [NSArray arrayWithObjects: [EDDice diceWithNoOfSides:6], [EDDice diceWithNoOfSides:6], nil], [NSNumber numberWithInt:8],
                            [NSArray arrayWithObjects: [EDDice diceWithNoOfSides:8], [EDDice diceWithNoOfSides:6], nil], [NSNumber numberWithInt:9],                            
                            [NSArray arrayWithObjects: [EDDice diceWithNoOfSides:8], [EDDice diceWithNoOfSides:8], nil], [NSNumber numberWithInt:10],
                            [NSArray arrayWithObjects: [EDDice diceWithNoOfSides:10], [EDDice diceWithNoOfSides:8], nil], [NSNumber numberWithInt:11],
                            [NSArray arrayWithObjects: [EDDice diceWithNoOfSides:10], [EDDice diceWithNoOfSides:10], nil], [NSNumber numberWithInt:12],                            
                            nil];
    NSArray* dices = [lookup objectForKey: [NSNumber numberWithInt:step]];
    if (dices) {
        NSMutableArray* result = [NSMutableArray arrayWithArray:dices];
        if (karma) [result addObject:[EDDice diceWithNoOfSides:6]];
        return [result copy];
    } else {
        NSInteger mod = step % 7;
        if (mod < 6) mod += 7;
        NSInteger d12Count = (step - mod) / 7;
        NSMutableArray* result = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < d12Count; i++) {
            [result addObject:[EDDice diceWithNoOfSides:12]];
        }
        [result addObjectsFromArray:[lookup objectForKey:[NSNumber numberWithInt:mod]]];
        if (karma) [result addObject:[EDDice diceWithNoOfSides:6]];        
        return result;
    }
}

- (NSArray*) diceForStep: (NSInteger) step
{
    return [self diceForStep:step withKarma:NO];
}

- (NSInteger) maxSupportedStep
{
    return 30;
}

@end
