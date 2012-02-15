//
//  EDViewController.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDDiceLookup.h"
#import "EDDiceResult.h"
#import "EDDice.h"

@interface EDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) id<EDDiceLookup> diceLookup;

- (IBAction)throwDiceButtonPressed:(id)sender;
@end
