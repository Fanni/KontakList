//
//  HomeViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "ContactsListViewController.h"

@interface HomeViewController : UIViewController<EditDelegate, ContactListDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
