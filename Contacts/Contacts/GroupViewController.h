//
//  GroupViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GroupViewDelegate <NSObject>

- (void)saveGroup;
- (void)cancelAction;

@end

@interface GroupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) NSManagedObjectContext *groupContext;
@property (weak, nonatomic) id<GroupViewDelegate> delegate;

- (IBAction)saveGroup:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end
