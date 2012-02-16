//
//  AddTelephoneViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/16/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "AddTelephoneViewController.h"
#import "AppDelegate.h"
#import "PhoneTypeViewController.h"
#import "Telephone.h"

@implementation AddTelephoneViewController
@synthesize type;
@synthesize fetchedResultsController;
@synthesize managedObjectContext;
@synthesize tipe;
@synthesize addDelegate;
@synthesize jenis;
@synthesize nomor;

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

    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Telephone" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    
    NSError *error = nil;
	if (![[self fetchedResultsController] performFetch:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
    
    tipe.text = @"None";
}

- (void)viewDidUnload
{
    [self setType:nil];
    [self setTipe:nil];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)addTelephone:(id)sender {
    NSLog(@"-------------------- %@",fetchedResultsController);
}

- (IBAction)cancelAdding:(id)sender {
    [self.addDelegate cancelAdd];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"typePhone"]) {
        PhoneTypeViewController *phoneView = [segue destinationViewController];
        phoneView.delegate = self;
    }
}

#pragma mark - phone type delegate

- (void)savePhoneType:(NSString *)pt{
    self.tipe.text = pt;
    self.jenis = pt;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelSavingPhoneType{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - fetched result controller

- (NSFetchedResultsController *)fetchedResultsController{
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    //membuat fetch request untuk sebuah entity
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Telephone" inManagedObjectContext:managedObjectContext];
    [request setEntity:description];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Phone"];
    
    self.fetchedResultsController = aFetchedResultsController;
    
    return fetchedResultsController;
}

@end
