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
@interface JsonDataRequest : NSObject
@property (nonatomic, copy)NSArray *jsonArr;
@property (nonatomic, weak) id<JsonDataDelegate>delegate;
-(void)getPapersFromServer;

-(void)insertQuestionsFromServerWithPaperID:(NSString*) paperID;
@end

@protocol JsonDataDelegate

-(void)DidFinishingLoading:(JsonDataRequest *)jsonData;

@end