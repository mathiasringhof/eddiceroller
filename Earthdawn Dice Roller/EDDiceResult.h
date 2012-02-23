//
//  EDDiceResult.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EDDice;

@interface EDDiceResult : NSObject

@property NSArray* results;
@property (strong, nonatomic) EDDice* thrownDice;

- (EDDiceResult*) initWithResults: (NSArray*) results 
                         fromDice: (EDDice*) thrownDice;

- (NSString*) description;
- (NSInteger) resultValue;

@end
