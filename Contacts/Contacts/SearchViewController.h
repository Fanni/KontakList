//
//  SearchViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *allContactsData; //for all the contacts data
@property (nonatomic, strong) NSMutableArray *displayedData; //for data that will be shown on the table
@property (nonatomic, strong) NSMutableArray *searchedData; //for search result data
- (void)findContacts;

@end
