//
//  EditViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@class EditViewController;
@protocol EditDelegate <NSObject>

- (void)EditViewControllerDidCancel:(EditViewController*)controller;
- (void)EditViewControllerDidSaveWithData:(Contacts*)data;

@end

@interface EditViewController : UITableViewController

@property (weak, nonatomic) id<EditDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *telphoneText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *fbText;
@property (strong, nonatomic) IBOutlet UITextField *twitterText;
@property (strong, nonatomic) NSMutableArray *contactArray;
@property (strong, nonatomic) NSManagedObjectContext *managedObjContext;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
