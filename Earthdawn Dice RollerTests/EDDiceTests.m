//
//  EDDiceTests.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceTests.h"

typedef NSInteger (^RandomNumberBlock)();
#define DICES_TO_TEST_FOR_AS_NUMBER_ARRAY [NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:10], [NSNumber numberWithInt:12], [NSNumber numberWithInt:20], nil]
#define MAX_PENALTY_TO_TEST_FOR 2

@interface EDDiceTests()
@property (strong, nonatomic) RandomNumberBlock block;

- (void)doTestRollWithPenalty: (NSUInteger) penalty;
@end

@implementation EDDiceTests

@synthesize block = _block;

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testRoll
{
    for (NSInteger i = 0; i <= MAX_PENALTY_TO_TEST_FOR; i++) {
        [self doTestRollWithPenalty:i];
    }
}

- (void)testDescription
{
    EDDice* dice = [[EDDice alloc] initWithNoOfSides:12];
    STAssertTrue([dice.description isEqualToString: @"D12"], @"Description w/o penalty is not working. Expected D12, got %@", dice.description);
    EDDice* diceWithPenalty = [[EDDice alloc] initWithNoOfSides:6 penalty:3];
    STAssertTrue([diceWithPenalty.description isEqualToString: @"D6 - 3"], @"Description w/ penalty is not working. Expected D6 - 3, got %@", diceWithPenalty.description);
}

- (void)doTestRollWithPenalty: (NSUInteger) penalty
{
    for (NSNumber* diceSides in DICES_TO_TEST_FOR_AS_NUMBER_ARRAY) {
        EDDice* dice = [[EDDice alloc] initWithNoOfSides:diceSides.intValue penalty:penalty];
        dice.delegate = self;
        for (NSInteger i = 1; i < 50; i++) {
            if ((i % diceSides.intValue) != 0) {     // do not assert for max values, e.g. D6 for 6, 12, ...
                __block NSInteger timesBlockWasCalled = 0;
                // define the block that delivers the "random" numbers to the dice
                self.block = ^{
                    if (i > diceSides.intValue) {
                        // return max number for as many times as needed, e.g. for 7: 6 + 1
                        return (i - (diceSides.intValue * timesBlockWasCalled));
                    } else {
                        return i;
                    }
                    timesBlockWasCalled++;
                };
                EDDiceResult* result = [dice roll];
                NSInteger expected = i - penalty;
                if (expected < 1) expected = 1;
                STAssertEquals(result.resultValue, expected, @"Result for D%d incorrect. Expected %d, dice rolled %d. i was %d, penalty %d", dice.noOfSides, expected, result.resultValue, i, penalty);
            }
        }
    }
    
}

- (NSInteger) generateRandomNumberFrom: (NSInteger)lowerBound to: (NSInteger) upperBound
{
    return self.block();
}

@end
