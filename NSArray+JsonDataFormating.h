//
//  NSArray+JsonDataFormating.h
//  NSsession
//
//  Created by kongyunpeng on 11/28/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PaperInfo+CoreDataProperties.h"
@interface NSArray (JsonDataFormating)


+(NSArray *)arrayOfTitlesWithPaperInfos:(NSArray *)paperInfos;
+(NSArray *)arrayOfTypesWithPaperInfos:(NSArray *)paperInfos;

+(NSArray *)arrayOfTitlesWithQuestions:(NSArray *)questions;

+(NSArray *)arrayOfOptionsWithQuestions:(NSArray *)questions;
@end
