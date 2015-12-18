//
//  Question+CoreDataProperties.h
//  AccountingExam
//
//  Created by trainer on 12/18/15.
//  Copyright © 2015 trainer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface Question (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *addTime;
@property (nullable, nonatomic, retain) NSString *paperID;
@property (nullable, nonatomic, retain) NSString *paperType;
@property (nullable, nonatomic, retain) NSString *questionID;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *answer;
@property (nullable, nonatomic, retain) NSString *userAnswer;

@end

NS_ASSUME_NONNULL_END
