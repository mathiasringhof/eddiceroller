//
//  EDRandomNumberGenerator.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EDRandomNumberGeneratorDelegate <NSObject>

- (NSInteger) generateRandomNumberFrom: (NSInteger)lowerBound to: (NSInteger) upperBound;

@end