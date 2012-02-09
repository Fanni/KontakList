//
//  PhoneViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *homePhoneText;
@property (strong, nonatomic) IBOutlet UITextField *officePhoneText;
@property (strong, nonatomic) IBOutlet UITextField *handPhoneText;
- (IBAction)savePhoneNumber:(id)sender;

@end
