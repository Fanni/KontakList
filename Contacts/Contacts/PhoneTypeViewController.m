//
//  PhoneTypeViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "PhoneTypeViewController.h"

@implementation PhoneTypeViewController
@synthesize typeOfPhone;
@synthesize phoneType;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    typeOfPhone = [NSArray arrayWithObjects: @"None",@"Home Phone", @"Handphone", @"Office Phone", @"Vacation Phone", @"Other" , nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setTypeOfPhone:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Picker view delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [typeOfPhone count];
}

- (NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [typeOfPhone objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    phoneType = [typeOfPhone objectAtIndex:row];
}

//Button method

- (IBAction)saveType:(id)sender {
    [self.delegate savePhoneType:phoneType];
}

- (IBAction)cancel:(id)sender {
    [self.delegate cancelSavingPhoneType];
}

@end
