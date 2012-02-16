//
//  HomeViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "HomeViewController.h"
#import "ContactsListViewController.h"

@implementation HomeViewController
@synthesize managedObjectContext;

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
    NSLog(@"manage context in home view %@",self.managedObjectContext);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - edit/add contact delegate implementation

- (void)EditViewControllerDidCancel:(SaveContactViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)EditViewControllerDidSaveWithData:(Contacts *)data{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - preapare for segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AddContact"]) {
        UINavigationController *navigation = segue.destinationViewController;
        SaveContactViewController *editView = [[navigation viewControllers] objectAtIndex:0];
        editView.managedObjContext = [self managedObjectContext];
        editView.delegate = self;
    }else if ([segue.identifier isEqualToString:@"AllContacts"]){
        UINavigationController *listNavigation = segue.destinationViewController;
        ContactsListViewController *contactList = [[listNavigation viewControllers] objectAtIndex:0];
        contactList.managedObjectContext = [self managedObjectContext];
        contactList.delegate = self;
    }else if ([segue.identifier isEqualToString:@"addGroup"]){
        GroupViewController *groupView = segue.destinationViewController;
        groupView.groupContext = [self managedObjectContext];
        groupView.delegate = self;
    }
}

#pragma mark - Contact list delegate

- (void)didCancel:(ContactsListViewController *)contactList{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Group view delegate

- (void)saveGroup{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
