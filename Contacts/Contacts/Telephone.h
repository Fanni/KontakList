//
//  Telephone.h
//  Contacts
//
//  Created by Fanni Ikhwan on 2/14/12.
//  Copyright (c) 2012 Kiranatama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contacts;

@interface Telephone : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Contacts *telephoneToContacts;

@end
