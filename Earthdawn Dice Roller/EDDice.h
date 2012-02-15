//
//  EDDice.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRandomNumberGenerator.h"
@class EDDiceResult;

@interface EDDice : NSObject

@property NSInteger noOfSides;
@property NSInteger penalty;
@property (strong, nonatomic) id<EDRandomNumberGeneratorDelegate> delegate;

- (EDDice*) initWithNoOfSides: (NSInteger) noOfSides;
- (EDDice*) initWithNoOfSides: (NSInteger) noOfSides 
                      penalty: (NSInteger) penalty;
- (EDDiceResult*) roll;

@end
