//
//  JsonDataManager.m
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "JsonDataManager.h"
#import "AppDelegate.h"
#import "Question.h"
#import "QuestionOption.h"
static NSString *const PaperInfoEntityName = @"PaperInfo";
static NSString *const QuestionEntityName = @"Question";

static NSString *const OptionEntityName = @"QuestionOption";

@implementation JsonDataManager



+(void)insertIntoPaperInfo:(NSString *)title paperID:(NSString *)paperID paperType:(NSString *)paperType {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
   NSArray *arr = [JsonDataManager findPaperInfoWithPaperID:paperID];
    PaperInfo *paperInfo;
    if (arr.count == 0) {
      paperInfo  = [NSEntityDescription insertNewObjectForEntityForName:PaperInfoEntityName inManagedObjectContext:appDelegate.managedObjectContext];
        paperInfo.title = title;
        paperInfo.paperID = paperID;
        paperInfo.paperType = paperType;
    }
  
    
}
+(NSArray *)findPaperInfoWithPaperID:(NSString*)paperID {
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
     NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:PaperInfoEntityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"paperID like %@",paperID];
    request.predicate = predicate;
    
  NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    return arr;
}

+(NSArray *)getPaperInfos {
   AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:PaperInfoEntityName];
   NSError *error = nil;
   NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return arr;
}

+(void)insertAllPapers:(NSArray *)jsonArr {
    for (NSDictionary *dic in jsonArr) {
        NSString *title = [dic valueForKey:@"title"];
        NSString *paperID = [dic valueForKey:@"paperID"];
        NSString *paperType = [dic valueForKey:@"paperType"];
        [JsonDataManager insertIntoPaperInfo:title paperID:paperID paperType:paperType];
    }
    
}
#pragma mark - Questions Operations
+(void)insertIntoQuestion:(NSString *)title paperID:(NSString *)paperID paperType:(NSString *)paperType questionID:(NSString *)questionID {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSArray *arr = [JsonDataManager findQuestionWithQuestionID:questionID];
    Question *question ;
    if (arr.count == 0) {
        question = [NSEntityDescription insertNewObjectForEntityForName:QuestionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
        question.title = title;
        question.paperID = paperID;
        question.paperType = paperType;
        question.questionID = questionID;
        question.addTime = [NSDate date];
        
    }
}

+(NSArray *)findQuestionWithQuestionID:(NSString *)questionID {
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:QuestionEntityName];
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"questionID like %@",questionID];
    request.predicate = prediate;
    NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
    return arr;
}

+(void)insertAllQuestions:(NSArray *)jsonArr {
    for (NSDictionary *dic in jsonArr) {
        NSString *title = [dic valueForKey:@"title"];
        NSString *paperID = [dic valueForKey:@"paperID"];
        NSString *paperType = [dic valueForKey:@"paperType"];
        NSString *questionID = [dic valueForKey:@"questionID"];
        [JsonDataManager insertIntoQuestion:title paperID:paperID paperType:paperType questionID:questionID];
        NSArray *options = [dic valueForKey:@"optionContent"];
        
         NSArray *arr = [JsonDataManager findQuestionOptionWithQuestionID:questionID];
        if (arr.count == 0) {
            for (NSString *option in options) {
                [JsonDataManager insertIntoQuestionOption:option questionID:questionID];
            }
        }
    }
    
}
+(NSArray *)getQuestions {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:QuestionEntityName];
    
    NSError *error = nil;
    NSMutableArray *arr = [[appDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"addTime" ascending:YES];
    NSArray *arrDescriptor = [NSArray arrayWithObject:descriptor];
   arr = [[arr sortedArrayUsingDescriptors:arrDescriptor] mutableCopy];
return arr;
}
#pragma -mark Question Option Operations

+(void)insertIntoQuestionOption:(NSString *)title questionID:(NSString *)questionID {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
   
   
    
   
        QuestionOption *qOption = [NSEntityDescription insertNewObjectForEntityForName:OptionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
        qOption.optionContent = title;
        qOption.questionID = questionID;
    
 
    
 }

+(NSArray *)findQuestionOptionWithQuestionID:(NSString *)questionID {
 AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:OptionEntityName];
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"questionID like %@",questionID];
    request.predicate = prediate;
    
    return [appDelegate.managedObjectContext executeFetchRequest:request error:nil];
}
+(NSArray *)getQuestionOptionsWithQuestionID:(NSString *)questionID {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:OptionEntityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"questionID like %@",questionID];
    request.predicate = predicate;
    NSError *error = nil;
    NSMutableArray *arr = [[appDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"optionContent" ascending:YES];
    NSArray *arrDescriptor = [NSArray arrayWithObject:descriptor];
    arr = [[arr sortedArrayUsingDescriptors:arrDescriptor] mutableCopy];
    
    
    return arr;
}

@end
