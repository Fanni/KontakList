//
//  DetailViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "DetailViewController.h"
#import "Contacts.h"

@implementation DetailViewController
@synthesize contactData;
@synthesize manageObjectContext;
@synthesize nameLabel;
@synthesize numberLabel;
@synthesize fbLabel;
@synthesize emailLabel;
@synthesize twitLabel;

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
    [self setNumberLabel:nil];
    [self setFbLabel:nil];
    [self setEmailLabel:nil];
    [self setTwitLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameLabel.text = contactData.name;
//    self.numberLabel.text = contactData.telphone.stringValue;
    self.emailLabel.text = contactData.email;
//    self.fbLabel.text = contactData.facebook;
    self.twitLabel.text = contactData.twitter;
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

@end
