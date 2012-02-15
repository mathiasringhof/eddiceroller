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
- (NSArray*) diceForStep: (NSInteger) step;
@required
- (NSArray*) diceForStep: (NSInteger) step 
               withKarma: (BOOL) karma;

@end