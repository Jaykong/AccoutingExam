//
//  JsonDataManager.h
//  AccountingExam
//
//  Created by trainer on 12/4/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaperInfo+CoreDataProperties.h"
#import "JsonData.h"
@interface JsonDataManager : NSObject
//插入数据
//-(void)insertIntoPaperInfo:(NSString *)title;
//获取数据
-(NSArray *)getPaperInfos;
-(void)insertAllPapers:(NSArray *)jsonArr;
@end

//@protocol JsonDataManagerDelegate
//
//-(void)didStartInsertDataIntoPaperInfo;
//
//@end
