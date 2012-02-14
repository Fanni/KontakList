//
//  Groups.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contacts;

@interface Groups : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *contactInGroup;
@end

@interface Groups (CoreDataGeneratedAccessors)

- (void)addContactInGroupObject:(Contacts *)value;
- (void)removeContactInGroupObject:(Contacts *)value;
- (void)addContactInGroup:(NSSet *)values;
- (void)removeContactInGroup:(NSSet *)values;

@end
