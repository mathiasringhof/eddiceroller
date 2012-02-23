//
//  EDViewController.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDViewController.h"

@interface EDViewController()
- (NSArray*) dicesForIndexPath: (NSIndexPath*)indexPath;
- (NSInteger) stepNoForIndexPath: (NSIndexPath*)indexPath;

@end

@implementation EDViewController
@synthesize stepTableView = _stepTableView;
@synthesize stepWithKarmaTableView = _stepWithKarmaTableView;
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
    [self setStepWithKarmaTableView:nil];
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

#pragma mark Actions

- (IBAction)throwDiceButtonPressed:(id)sender {
    NSArray* dices = [self.diceLookup diceForStep:1];
    for (EDDice* dice in dices) {
        
    }
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
    static NSString *CellIdentifierStep = @"Step Cell";
    static NSString* CellIdentifierKarma = @"Karma Step Cell";
    
    NSString* cellIdentifier;
    
    if (tableView == self.stepTableView)
        cellIdentifier = CellIdentifierStep;
    else {
        cellIdentifier = CellIdentifierKarma;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    NSArray* dices = [self dicesForIndexPath:indexPath tableView:tableView];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", [self stepNoForIndexPath:indexPath]];
    NSMutableString* detailText = [[NSMutableString alloc] init];
    for (EDDice* dice in dices) {
        if (detailText.length == 0) {
            [detailText appendString:dice.description];
        } else {
            [detailText appendFormat:@" + %@", dice.description];
        }
    }
    cell.detailTextLabel.text = [detailText copy];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* dices = [self dicesForIndexPath:indexPath tableView:tableView];
    NSInteger result = 0;
    NSMutableString* resultString = [[NSMutableString alloc] init];
    for (EDDice* dice in dices) {
        EDDiceResult* diceResult = [dice roll];
        result = result + diceResult.resultValue;
        if (resultString.length == 0) {
            [resultString appendString:diceResult.description];
        } else {
            [resultString appendFormat:@" + %@", diceResult.description];
        }
    }
    [self setResult:[NSString stringWithFormat:@"%@: %d", resultString, result]];
    [self.stepTableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Public methods
- (void)setResult: (NSString*) result
{
    self.resultLabel.text = [NSString stringWithFormat:@"Result: %@", result];
}

#pragma mark - Private methods
- (NSArray*) dicesForIndexPath: (NSIndexPath*)indexPath tableView: (UITableView*)tableView
{
    NSInteger stepNo = [self stepNoForIndexPath:indexPath];
    NSArray* dices = [self.diceLookup diceForStep:stepNo withKarma:(tableView == self.stepWithKarmaTableView)];
    return dices;
}

- (NSInteger) stepNoForIndexPath: (NSIndexPath*)indexPath
{
    NSInteger stepNo = indexPath.row + 1;
    return stepNo;
}

@end