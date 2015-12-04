//
//  JsonDataManager.m
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "JsonDataManager.h"
#import "AppDelegate.h"
static NSString *const PaperInfoEntityName = @"PaperInfo";
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
@end
