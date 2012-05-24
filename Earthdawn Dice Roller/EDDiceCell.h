//
//  EDDiceCell.h
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDDiceCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *stepLabel;
@property (nonatomic, weak) IBOutlet UILabel *diceLabel;
@property (nonatomic, weak) IBOutlet UIButton *karmaButton;

- (void)setStep: (NSInteger)step 
          dices: (NSArray*)dices;

@end
