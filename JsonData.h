//
//  JsonData.h
//  AccountingExam
//
//  Created by trainer on 12/2/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonDataManager.h"
@protocol JsonDataDelegate;
@interface JsonData : NSObject
@property (nonatomic, copy)NSArray *jsonArr;
@property (nonatomic, weak) id<JsonDataDelegate>delegate;
-(void)getPapers;

-(void)getQuestionsWithPaperID:(NSString*) paperID;
@end

@protocol JsonDataDelegate

-(void)DidFinishingLoading:(JsonData *)jsonData;

@end