//
//  QuestionOption+CoreDataProperties.h
//  AccountingExam
//
//  Created by trainer on 12/11/15.
//  Copyright © 2015 trainer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "QuestionOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionOption (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *questionID;
@property (nullable, nonatomic, retain) NSString *optionContent;

@end

NS_ASSUME_NONNULL_END
