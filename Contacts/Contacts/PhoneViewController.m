//
//  PhoneViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "PhoneViewController.h"

@implementation PhoneViewController
@synthesize phoneDelegate;
@synthesize phoneNumber;
@synthesize phoneType;

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

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"test");
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setPhoneNumber:nil];
    [self setPhoneType:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)savePhoneNumber:(id)sender {
    [[self phoneDelegate] saveThisPhoneNumber:[NSNumber numberWithInt:[phoneNumber.text intValue]] withType:type];
}

- (IBAction)cancelSaving:(id)sender {
    [self.phoneDelegate abortSaveNumber];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [self.phoneNumber becomeFirstResponder];
    }
}

#pragma mark - Phone Type delegate

- (void)savePhoneType:(NSString *)pt{
    type = pt;
    [self.phoneType setText:type];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelSavingPhoneType{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - segue delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"typeView"]) {
        PhoneTypeViewController *phoneTipe = [segue destinationViewController];
        phoneTipe.delegate = self;
    }
}

@end
