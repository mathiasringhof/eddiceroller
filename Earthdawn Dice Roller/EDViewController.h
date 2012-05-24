//
//  EDViewController.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDDiceLookup.h"

@interface EDViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultDetailLabel;
@property (strong, nonatomic) id<EDDiceLookup> diceLookup;
@property (weak, nonatomic) IBOutlet UITableView *stepTableView;

- (IBAction)karmaButtonUsed:(UIButton *)sender;

@end
