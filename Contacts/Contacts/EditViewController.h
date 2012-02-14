//
//  EditViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/2/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"
#import "PhoneViewController.h"

@class EditViewController;
@protocol EditDelegate <NSObject>

- (void)EditViewControllerDidCancel:(EditViewController*)controller;
- (void)EditViewControllerDidSaveWithData:(Contacts*)data;

@end

@interface EditViewController : UITableViewController<PhoneViewDelegate>

@property (weak, nonatomic) id<EditDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *twitterText;
@property (strong, nonatomic) NSMutableArray *contactArray;
@property (strong, nonatomic) NSManagedObjectContext *managedObjContext;
@property (strong, nonatomic) NSString *type;
@property (assign, nonatomic) NSNumber *number;
@property (strong, nonatomic) PhoneViewController *phoneView;
@property (strong, nonatomic) Contacts *cPhone;
@property (strong, nonatomic) IBOutlet UILabel *status;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
