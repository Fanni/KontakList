//
//  GroupViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "GroupViewController.h"
#import "Groups.h"

@implementation GroupViewController
@synthesize nameText;
@synthesize groupContext;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setNameText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveGroup:(id)sender {
    Groups *group = (Groups*)[NSEntityDescription insertNewObjectForEntityForName:@"Groups" inManagedObjectContext:groupContext];
    [group setName:nameText.text];
    
    NSError *error;
    if (![groupContext save:&error]) {
        UIAlertView *saveFailed = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, but something wrong with saving data process" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [saveFailed show];
    }
    
    [self.delegate saveGroup];
}

- (IBAction)cancelAction:(id)sender {
    [self.delegate cancelAction];
}

@end
