//
//  PhoneViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhoneViewController;
@protocol PhoneViewDelegate <NSObject>

- (void)saveThisPhoneNumber:(NSDictionary*)phone;

@end

@interface PhoneViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *homePhoneText;
@property (strong, nonatomic) IBOutlet UITextField *officePhoneText;
@property (strong, nonatomic) IBOutlet UITextField *handPhoneText;
@property (strong, nonatomic) NSMutableDictionary* phones;
@property (weak, nonatomic) id<PhoneViewDelegate> phoneDelegate;

- (IBAction)savePhoneNumber:(id)sender;

@end
