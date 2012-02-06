//
//  ContactsListViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactsListViewController;
@protocol ContactListDelegate <NSObject>

- (void)didCancel:(ContactsListViewController*)contactList;

@end

@interface ContactsListViewController : UITableViewController<UISearchBarDelegate>{
    @private
    NSMutableArray* contacts;
    BOOL search;
}

@property (nonatomic, strong) NSMutableArray* contacts;
@property (nonatomic, strong) NSMutableArray* searchedContacts;
@property (nonatomic, strong) NSMutableArray* contactName;
@property (nonatomic, strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, weak) id<ContactListDelegate> delegate;
- (IBAction)goHome:(id)sender;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
