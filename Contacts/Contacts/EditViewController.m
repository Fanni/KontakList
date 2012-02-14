//
//  EditViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "EditViewController.h"
#import "Telephone.h"

@class AppDelegate;
@implementation EditViewController
@synthesize nameText;
@synthesize emailText;
@synthesize twitterText;
@synthesize delegate;
@synthesize contactArray;
@synthesize managedObjContext;
@synthesize type;
@synthesize number;
@synthesize phoneView;
@synthesize cPhone;
@synthesize status;

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
    
    status.text = @"not saved";
}

- (void)viewDidUnload
{
    [self setNameText:nil];
    [self setEmailText:nil];
    [self setTwitterText:nil];
    [self setStatus:nil];
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
    [contactDB setEmail:self.emailText.text];
    [contactDB setTwitter:self.twitterText.text];
    
    Telephone *telephone = (Telephone *)[NSEntityDescription insertNewObjectForEntityForName:@"Telephone" inManagedObjectContext:managedObjContext];
    [cPhone addContactsToTelephoneObject:telephone];
    [telephone setNumber:self.number];
    [telephone setType:self.type];
    
    NSError *error;
    if (![managedObjContext save:&error]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Serious Error!!!" message:@"turn this application off!" delegate:self cancelButtonTitle:@"Oke" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    [contactArray insertObject:contactDB atIndex:0];
    
    [[self delegate] EditViewControllerDidSaveWithData:contactDB];
}

#pragma mark - phone view delegate

- (void)saveThisPhoneNumber:(NSNumber*)phone withType:(NSString *)tipe{
    
    self.number = phone;
    self.type = tipe;
    self.status.text = @"saved";
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)abortSaveNumber{
    self.status.text = @"save canceled";
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - segue delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"telephoneSegue"]) {
        UINavigationController *navigation = [segue destinationViewController];
        PhoneViewController *phone = [[navigation viewControllers] objectAtIndex:0];
        phone.phoneDelegate = self;
    }
}

@end
