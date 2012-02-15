//
//  EDDiceResult.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDDice.h"

@interface EDDiceResult : NSObject

@property NSInteger resultValue;
@property (strong, nonatomic) EDDice* thrownDice;

- (EDDiceResult*) initWithResultValue: (NSInteger)resultValue 
                             fromDice: (EDDice*) thrownDice;

- (NSString*) description;

@end
