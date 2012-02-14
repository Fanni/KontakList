//
//  PhoneViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneTypeViewController.h"

@class PhoneViewController;
@protocol PhoneViewDelegate <NSObject>

- (void)saveThisPhoneNumber:(NSNumber*)phone withType:(NSString*)tipe;
- (void)abortSaveNumber;

@end

@interface PhoneViewController : UITableViewController<PhoneTypeDelegate>{
    NSString* type;
}
@property (weak, nonatomic) id<PhoneViewDelegate> phoneDelegate;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UILabel *phoneType;

- (IBAction)savePhoneNumber:(id)sender;
- (IBAction)cancelSaving:(id)sender;

@end
