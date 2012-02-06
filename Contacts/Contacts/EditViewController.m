//
//  EditViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "EditViewController.h"

@class AppDelegate;
@implementation EditViewController
@synthesize nameText;
@synthesize telphoneText;
@synthesize emailText;
@synthesize fbText;
@synthesize twitterText;
@synthesize delegate;
@synthesize contactArray;
@synthesize managedObjContext;

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setNameText:nil];
    [self setTelphoneText:nil];
    [self setEmailText:nil];
    [self setFbText:nil];
    [self setTwitterText:nil];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameText becomeFirstResponder];
    }
}

#pragma mark - self delegate implementation

- (IBAction)cancel:(id)sender {
    [[self delegate] EditViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender {
    NSLog(@"------------ %@",self.managedObjContext);
    Contacts *contactDB = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:managedObjContext];
    [contactDB setName:self.nameText.text];
    [contactDB setTelphone:[NSNumber numberWithInt:[self.telphoneText.text intValue]]];
    [contactDB setEmail:self.emailText.text];
    [contactDB setFacebook:self.fbText.text];
    [contactDB setTwitter:self.twitterText.text];
    
    NSError *error;
    if (![managedObjContext save:&error]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Serious Error!!!" message:@"turn this application off!" delegate:self cancelButtonTitle:@"Oke" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    [contactArray insertObject:contactDB atIndex:0];
}


@end
