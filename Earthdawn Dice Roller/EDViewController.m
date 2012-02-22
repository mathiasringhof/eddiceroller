//
//  EDViewController.m
//  Earthdawn Dice Roller
//
//  Created by Mathias Ringhof on 2/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EDViewController.h"

@implementation EDViewController
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
    self.stepTableView.dataSource = self;
}

- (void)viewDidUnload
{
    [self setResultLabel:nil];
    [self setStepTableView:nil];
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
    static NSString *CellIdentifier = @"Step Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSInteger stepNo = indexPath.row + 1;
    NSArray* dices = [self.diceLookup diceForStep:stepNo];    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", stepNo];
    NSMutableString* detailText = [[NSMutableString alloc] init];
    for (EDDice* dice in dices) {
        if (detailText.length == 0) {
            [detailText appendString:dice.description];
        } else {
            [detailText appendFormat:@" + %@", dice.description];
        }
    }
    cell.detailTextLabel.text = detailText;
    
    return cell;
}
@end
