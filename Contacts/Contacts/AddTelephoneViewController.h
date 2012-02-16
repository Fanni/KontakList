//
//  AddTelephoneViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/16/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneTypeViewController.h"

@protocol AddDelegate <NSObject>

- (void)cancelAdd;

@end

@interface AddTelephoneViewController : UITableViewController<PhoneTypeDelegate>

@property (weak, nonatomic) id<AddDelegate> addDelegate;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UILabel *tipe;
@property (strong, nonatomic) NSString *jenis;
@property (strong, nonatomic) NSNumber *nomor;

- (IBAction)addTelephone:(id)sender;
- (IBAction)cancelAdding:(id)sender;

@end
