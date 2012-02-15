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

@property NSUInteger noOfSides;
@property (strong, nonatomic) id<EDRandomNumberGeneratorDelegate> randomNumberGenerator;

- (EDDice*) initWithNoOfSides: (NSUInteger) noOfSides;
- (EDDiceResult*) roll;


@end
