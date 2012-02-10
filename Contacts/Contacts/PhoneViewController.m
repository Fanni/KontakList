//
//  PhoneViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "PhoneViewController.h"

@implementation PhoneViewController
@synthesize homePhoneText;
@synthesize officePhoneText;
@synthesize handPhoneText;
@synthesize phones;
@synthesize phoneDelegate;

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

- (void)viewDidLoad{
    [super viewDidLoad];
    phones = [[NSMutableDictionary alloc] init];
}

- (void)viewDidUnload
{
    [self setHomePhoneText:nil];
    [self setOfficePhoneText:nil];
    [self setHandPhoneText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)savePhoneNumber:(id)sender {
    
    [phones setValue:homePhoneText.text forKey:@"Home Phone"];
    [phones setValue:officePhoneText.text forKey:@"Office Phone"];
    [phones setValue:handPhoneText.text forKey:@"Handphone"];
     
    [phoneDelegate saveThisPhoneNumber:phones];
    
}

- (IBAction)abortSave:(id)sender {
    [phoneDelegate abortSaveNumber];
}
@end
