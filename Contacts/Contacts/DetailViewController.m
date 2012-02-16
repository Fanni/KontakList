//
//  DetailViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "DetailViewController.h"
#import "Contacts.h"
#import "Telephone.h"
#import "TelephoneNumberViewController.h"

@implementation DetailViewController
@synthesize contactData;
@synthesize manageObjectContext;
@synthesize nameLabel;
@synthesize emailLabel;
@synthesize twitLabel;
@synthesize phoneType;
@synthesize phoneNumber;
@synthesize data;

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
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setEmailLabel:nil];
    [self setTwitLabel:nil];
    [self setPhoneType:nil];
    [self setPhoneNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameLabel.text = contactData.name;
    self.emailLabel.text = contactData.email;
    self.twitLabel.text = contactData.twitter;
    
    for (NSManagedObject* number in self.data) {
        NSManagedObject* phoneDetail = [number valueForKey:@"contactsToTelephone"];
        NSLog(@"phone detail %@",phoneDetail);
        if ([[[phoneDetail valueForKey:@"type"] allObjects] count] == 0) {
            self.phoneType.text = @"None";
            self.phoneNumber.text = @"empty";
        }else{
            self.phoneType.text = [[[phoneDetail valueForKey:@"type"] allObjects] objectAtIndex:0];
            self.phoneNumber.text = [NSString stringWithFormat:@"%d",[[[phoneDetail valueForKey:@"number"] allObjects] objectAtIndex:0]];
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phoneDetail"]) {
        TelephoneNumberViewController *telephone = [segue destinationViewController];
        if (self.data == nil) {
            [telephone setTelephoneData:[NSMutableArray arrayWithObjects:@"", nil]];
        }else{
            [telephone setTelephoneData:self.data];
        }
    }
}

@end
