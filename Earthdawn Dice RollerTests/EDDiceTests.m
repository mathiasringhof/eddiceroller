//
//  EDDiceTests.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceTests.h"

typedef NSInteger (^RandomNumberBlock)();

@interface EDDiceTests()
@property (strong, nonatomic) RandomNumberBlock block;
@property (strong, nonatomic) EDDice* dice;
@end

@implementation EDDiceTests

@synthesize dice = _dice;
@synthesize block = _block;

- (void)setUp
{
    [super setUp];
    self.dice = [[EDDice alloc] initWithNoOfSides:6];
    self.dice.delegate = self;
}

- (void)tearDown
{
    [super tearDown];
    self.dice = nil;
}

- (void)testRollOneToFive
{
    for (NSInteger i = 1; i < 6; i++) {
        self.block = ^{
            return i;
        };
        EDDiceResult* result = [self.dice roll];
        STAssertEquals(result.resultValue, i, @"Result does not match expected value");
    }
}

- (void)testRollSixPlus
{
    __block BOOL returnedSix = NO;
    self.block = ^{
        if (returnedSix)
            return 3;
        else {
            returnedSix = YES;
            return 6;
        }
            
    };
    EDDiceResult* result = [self.dice roll];
    STAssertEquals(result.resultValue, 9, @"Result does not match expected value");
}

- (NSInteger) generateRandomNumberFrom: (NSInteger)lowerBound to: (NSInteger) upperBound
{
    return self.block();
}

@end
