//
//  EDDiceResultTests.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceResultTests.h"

@implementation EDDiceResultTests

- (void)testDiceResultHardcoded
{
    EDDice* dice = [[EDDice alloc] initWithNoOfSides:6];
    EDDiceResult* diceResult = [[EDDiceResult alloc] initWithResults:[NSArray arrayWithObject:[NSNumber numberWithInt:3]] fromDice:dice];
    STAssertTrue([diceResult.description isEqualToString:@"3"], @"DiceResult description %@ does not match expected value. ResultValue was %d", diceResult.description, diceResult.resultValue);
    diceResult.results = [NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:1], nil];
    STAssertTrue([diceResult.description isEqualToString:@"6 + 1"], @"DiceResult description %@ does not match expected value. ResultValue was %d", diceResult.description, diceResult.resultValue);
    diceResult.results = [NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:6], [NSNumber numberWithInt:4], nil];
    STAssertTrue([diceResult.description isEqualToString:@"6 + 6 + 4"], @"DiceResult description %@ does not match expected value. ResultValue was %d", diceResult.description, diceResult.resultValue);
}

- (void)testDiceResultHardcodedWithPenalty
{
    EDDice* dice = [[EDDice alloc] initWithNoOfSides:6 penalty:3];
    EDDiceResult* diceResult = [[EDDiceResult alloc] initWithResults:[NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:3], nil] fromDice:dice];
    STAssertTrue([diceResult.description isEqualToString:@"6 + 3 - 3"], @"DiceResult description %@ does not match expected value. ResultValue was %d, dice was %@", diceResult.description, diceResult.resultValue, dice);
}

@end
