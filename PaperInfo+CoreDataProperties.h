//
//  PaperInfo+CoreDataProperties.h
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PaperInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaperInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *paperID;
@property (nullable, nonatomic, retain) NSString *paperType;
@property (nullable, nonatomic, retain) NSDate *addTime;

@end

NS_ASSUME_NONNULL_END
