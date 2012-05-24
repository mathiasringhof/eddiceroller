//
//  EDDiceCell.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDDiceCell.h"
#import "EDDice.h"

@interface EDDiceCell()
@end

@implementation EDDiceCell

@synthesize stepLabel = _stepLabel;
@synthesize diceLabel = _diceLabel;
@synthesize karmaButton = _karmaButton;

- (id)initWithStyle:(UITableViewCellStyle)style 
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStep: (NSInteger)step 
          dices: (NSArray*)dices
{
    self.stepLabel.text = [NSString stringWithFormat:@"%d", step];
    NSMutableString* diceLabelText = [[NSMutableString alloc] init];
    for (EDDice* dice in dices) {
        if (diceLabelText.length == 0) {
            [diceLabelText appendString:dice.description];
        } else {
            [diceLabelText appendFormat:@" + %@", dice.description];
        }
    }
    self.diceLabel.text = [diceLabelText copy];
}

@end
