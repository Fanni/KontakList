//
//  Contacts.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/9/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Telephone;

@interface Contacts : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) Telephone *contactsToTelephone;

@end
