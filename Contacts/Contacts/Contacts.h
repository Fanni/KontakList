//
//  Contacts.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Groups, Telephone;

@interface Contacts : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * twitter;
@property (nonatomic, retain) NSSet *contactsToTelephone;
@property (nonatomic, retain) Groups *groupOfContact;
@end

@interface Contacts (CoreDataGeneratedAccessors)

- (void)addContactsToTelephoneObject:(Telephone *)value;
- (void)removeContactsToTelephoneObject:(Telephone *)value;
- (void)addContactsToTelephone:(NSSet *)values;
- (void)removeContactsToTelephone:(NSSet *)values;

@end
