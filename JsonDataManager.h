//
//  JsonDataManager.h
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaperInfo+CoreDataProperties.h"
#import "JsonDataRequest.h"
@interface JsonDataManager : NSObject
//插入数据
//-(void)insertIntoPaperInfo:(NSString *)title;
//获取数据
+(NSArray *)getPaperInfos;
+(void)insertAllPapers:(NSArray *)jsonArr;
-(void)insertAllQuestions:(NSArray *)jsonArr;
+(NSArray *)getQuestionsWithPaperID:(NSString *)paperID;

+(NSArray *)getQuestionOptionsWithQuestionID:(NSString *)questionID ;
@end

//@protocol JsonDataManagerDelegate
//
//-(void)didStartInsertDataIntoPaperInfo;
//
//@end
