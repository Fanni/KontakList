//
//  TelephoneNumberViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/15/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTelephoneViewController.h"

@interface TelephoneNumberViewController : UITableViewController<AddDelegate>

@property (strong, nonatomic) NSMutableArray* telephoneData;
@property (strong, nonatomic) NSMutableArray* theType;
@property (strong, nonatomic) NSMutableArray* theNumber;

@end
