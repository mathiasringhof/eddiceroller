//
//  EDViewController.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDViewController.h"
#import "EDDiceResult.h"
#import "EDDice.h"
#import "EDDiceCell.h"

@interface EDViewController()
- (NSInteger) stepNoForIndexPath: (NSIndexPath*)indexPath;
@end

@implementation EDViewController
@synthesize resultDetailLabel = _resultDetailLabel;
@synthesize stepTableView = _stepTableView;
@synthesize resultLabel = _resultLabel, diceLookup = _diceLookup;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setResultLabel:nil];
    [self setStepTableView:nil];
    [self setResultDetailLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; // always one section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.diceLookup maxSupportedStep];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Dice Cell";
        
    EDDiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[EDDiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger step = [self stepNoForIndexPath:indexPath];
    [cell setStep:step
            dices:[self.diceLookup diceForStep:step withKarma:NO]];
    cell.karmaButton.tag = step;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* dices = [self.diceLookup diceForStep:[self stepNoForIndexPath:indexPath]];
    [self rollDices:dices];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Public methods
- (IBAction)karmaButtonUsed:(UIButton *)sender {
    NSArray* dices = [self.diceLookup diceForStep:sender.tag withKarma:YES];
    [self rollDices:dices];
}

#pragma mark - Private methods
- (NSInteger) stepNoForIndexPath: (NSIndexPath*)indexPath
{
    NSInteger stepNo = indexPath.row + 1;
    return stepNo;
}

- (void) rollDices: (NSArray*)dices
{
    NSInteger result = 0;
    NSMutableString* resultString = [NSMutableString stringWithString:@"("];
    for (EDDice* dice in dices) {
        EDDiceResult* diceResult = [dice roll];
        result = result + diceResult.resultValue;
        if (resultString.length == 1) {
            [resultString appendString:diceResult.description];
        } else {
            [resultString appendFormat:@") + (%@", diceResult.description];
        }
    }
    [resultString appendString:@")"];
    self.resultLabel.text = [NSString stringWithFormat:@"%d", result];
    self.resultDetailLabel.text = resultString;
}

@end