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

@interface EDViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) id<EDDiceLookup> diceLookup;
@property (weak, nonatomic) IBOutlet UITableView *stepTableView;
@property (weak, nonatomic) IBOutlet UITableView *stepWithKarmaTableView;

- (void)setResult: (NSString*) result;

@end
