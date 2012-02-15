//
//  DetailViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) Contacts *contactData;
@property (strong, nonatomic) NSMutableArray* data;
@property (nonatomic, strong) NSManagedObjectContext *manageObjectContext;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *twitLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneType;
@property (strong, nonatomic) IBOutlet UILabel *phoneNumber;

@end
