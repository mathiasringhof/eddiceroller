//
//  EDDiceLookup.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EDDiceLookup <NSObject>
@optional
- (NSArray*) diceForStep: (NSUInteger) step;
@required
- (NSArray*) diceForStep: (NSUInteger) step 
               withKarma: (BOOL) karma;

@end