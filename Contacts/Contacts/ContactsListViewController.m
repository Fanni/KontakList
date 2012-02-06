//
//  ContactsListViewController.m
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import "ContactsListViewController.h"
#import "Contacts.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

@implementation ContactsListViewController
@synthesize searchBar;
@synthesize contacts;
@synthesize managedObjectContext;
@synthesize delegate;
@synthesize searchedContacts;
@synthesize contactName;

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
    [self setSearchBar:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:managedObjectContext];
    [request setEntity:description];
    
    NSSortDescriptor *sortDescript = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sortDescript]];
    
    NSError *error;
    NSMutableArray *fetchResult = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (fetchResult == nil) {
        //later :D
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"for this time, the contact list is empty, please create one" delegate:self cancelButtonTitle:@"Oke" otherButtonTitles:nil, nil];
        [alert show];
    }
    self.contacts = fetchResult;
    
    //for searching
    [request setResultType:NSDictionaryResultType];
    [request setPropertiesToFetch:[NSArray arrayWithObject:@"name"]];
    NSMutableArray *forSearch = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (forSearch == nil) {
        //some action
    }
    
    self.contactName = [forSearch valueForKey:@"name"];
    
    search = NO;
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

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (search) {
        return @"Search Result";
    }else{
        return @"Contacts List";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (search) {
        return [searchedContacts count];
    }else{
        return [contacts count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (search) {
        Contacts *result = [searchedContacts objectAtIndex:indexPath.row];
        cell.textLabel.text = result.name;
        cell.detailTextLabel.text = result.telphone.stringValue;
    }else{
        Contacts *contact = [contacts objectAtIndex:indexPath.row];
        cell.textLabel.text = contact.name;
        cell.detailTextLabel.text = contact.telphone.stringValue;
    }
    
    return cell;
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
//    DetailViewController *detailView = [[DetailViewController alloc] init];
//    if (search) {
//        NSLog(@"%@ dipilih",[searchedContacts objectAtIndex:indexPath.row]);
//        detailView.contactData = [searchedContacts objectAtIndex:indexPath.row];
//    }else{
//        NSLog(@"%@ dipilih",[contacts objectAtIndex:indexPath.row]);
//        detailView.contactData = [contacts objectAtIndex:indexPath.row];
//    }
}

- (IBAction)goHome:(id)sender {
    [[self delegate] didCancel:self];
}

#pragma mark - SearchBar delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self.searchDisplayController searchResultsDataSource];
    if (searchText.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name contains[c] %@)",searchText];
        self.searchedContacts = [[self.contacts filteredArrayUsingPredicate:predicate] mutableCopy];
        NSLog(@"%@",self.searchedContacts);
        search = YES;
    }else{
        search = NO;
    }
    [[self.searchDisplayController searchResultsTableView] reloadData];
}

#pragma mark - prepare for segue method

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailViewController *dvc = (DetailViewController *)[segue destinationViewController];
    
    dvc.manageObjectContext = managedObjectContext;
    
    if ([[segue identifier] isEqualToString:@"detailContact"])
    {
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        if (search) {
            dvc.contactData = [searchedContacts objectAtIndex:selectedIndex];
            NSLog(@"ditap");
        }else{
            dvc.contactData = [contacts objectAtIndex:selectedIndex];
            NSLog(@"ditekan");
        }
    }
}

@end
