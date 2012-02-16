//
//  TelephoneNumberViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/15/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "TelephoneNumberViewController.h"


@implementation TelephoneNumberViewController
@synthesize telephoneData;
@synthesize theType;
@synthesize theNumber;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"isinya ini apaan yah ---> %@",telephoneData);
    for (NSManagedObject* phoneContact in telephoneData) {
        if ([[phoneContact valueForKey:@"contactsToTelephone"] count] == 0) {
            theType = [NSMutableArray arrayWithObjects:@"", nil];
            theNumber = [NSMutableArray arrayWithObjects:@"", nil];
        }else{
            NSManagedObject* phone = [phoneContact valueForKey:@"contactsToTelephone"];
            theType = [[[phone valueForKey:@"type"] allObjects] mutableCopy];
            theNumber = [[[phone valueForKey:@"number"] allObjects] mutableCopy];
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setTelephoneData:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([[theNumber objectAtIndex:indexPath.row] isEqual:@""]) {
        cell.textLabel.text = [theNumber objectAtIndex:indexPath.row];
        cell.textLabel.text = [theType objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%d",[theNumber objectAtIndex:indexPath.row]];
        cell.detailTextLabel.text = [theType objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - add view delegate implementation

- (void)cancelAdd{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"add"]) {
        UINavigationController *theView = [segue destinationViewController];
        AddTelephoneViewController *addView = [[theView viewControllers] objectAtIndex:0];
        [addView setAddDelegate:self];
    }
}

@end
