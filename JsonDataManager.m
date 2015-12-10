//
//  JsonDataManager.m
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "JsonDataManager.h"
#import "AppDelegate.h"
#import "Question+CoreDataProperties.h"
static NSString *const PaperInfoEntityName = @"PaperInfo";
static NSString *const QuestionEntityName = @"Question";
@implementation JsonDataManager



-(void)insertIntoPaperInfo:(NSString *)title paperID:(NSString *)paperID paperType:(NSString *)paperType {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    PaperInfo *paperInfo = [NSEntityDescription insertNewObjectForEntityForName:PaperInfoEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    paperInfo.title = title;
    paperInfo.paperID = paperID;
    paperInfo.paperType = paperType;
    
}
-(NSArray *)getPaperInfos {
   AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:PaperInfoEntityName];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"paperID like %@",_paperID];
    //request.predicate =
    NSError *error = [[NSError alloc] init];
   NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return arr;
}

-(void)insertAllPapers:(NSArray *)jsonArr {
    for (NSDictionary *dic in jsonArr) {
        NSString *title = [dic valueForKey:@"title"];
        NSString *paperID = [dic valueForKey:@"paperID"];
        NSString *paperType = [dic valueForKey:@"paperType"];
        [self insertIntoPaperInfo:title paperID:paperID paperType:paperType];
    }
    
}
#pragma mark - Questions Operations
-(void)insertIntoQuestion:(NSString *)title paperID:(NSString *)paperID paperType:(NSString *)paperType questionID:(NSString *)questionID {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    Question *question = [NSEntityDescription insertNewObjectForEntityForName:QuestionEntityName inManagedObjectContext:appDelegate.managedObjectContext];
    
    question.title = title;
    question.paperID = paperID;
    question.paperType = paperType;
    question.questionID = questionID;
    
}
-(void)insertAllQuestions:(NSArray *)jsonArr {
    for (NSDictionary *dic in jsonArr) {
        NSString *title = [dic valueForKey:@"title"];
        NSString *paperID = [dic valueForKey:@"paperID"];
        NSString *paperType = [dic valueForKey:@"paperType"];
         NSString *questionID = [dic valueForKey:@"questionID"];
        [self insertIntoQuestion:title paperID:paperID paperType:paperType questionID:questionID];
    }
    
}
-(NSArray *)getQuestions {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:QuestionEntityName];
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"paperID like %@",_paperID];
    //request.predicate =
    NSError *error = [[NSError alloc] init];
    NSArray *arr = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return arr;
}
@end
