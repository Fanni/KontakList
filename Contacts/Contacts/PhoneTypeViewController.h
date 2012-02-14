//
//  PhoneTypeViewController.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhoneTypeDelegate <NSObject>

- (void)savePhoneType:(NSString*)pt;
- (void)cancelSavingPhoneType;

@end

@interface PhoneTypeViewController : UIViewController<UIPickerViewDelegate>

@property (weak, nonatomic) id<PhoneTypeDelegate> delegate;
@property (strong, nonatomic) NSArray* typeOfPhone;
@property (strong, nonatomic) NSString* phoneType;

- (IBAction)saveType:(id)sender;
- (IBAction)cancel:(id)sender;

@end
