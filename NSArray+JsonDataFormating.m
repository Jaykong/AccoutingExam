//
//  NSArray+JsonDataFormating.m
//  NSsession
//
//  Created by kongyunpeng on 11/28/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "NSArray+JsonDataFormating.h"
#import "Question+CoreDataProperties.h"
@implementation NSArray(JsonDataFormating)

+(NSArray *)arrayOfTitlesWithQuestions:(NSArray *)questions {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (Question *q in questions) {
        [arr addObject:q.title];
    }
   
    return arr;
}

//+(NSArray *)returnPaperTitlesFromJsonArray:(NSArray *)parentArr{
//    NSMutableArray *papers = [[NSMutableArray alloc] init];
//    for (NSDictionary *subDic in parentArr) {
//        
//        [papers addObject:[subDic valueForKey:@"title"]];
//        
//    }
//    return papers;
//}
//
//+(NSArray *)returnPaperTypesFromJsonArray:(NSArray *)parentArr {
//    NSMutableArray *papers = [[NSMutableArray alloc] init];
//    for (NSDictionary *subDic in parentArr) {
//        NSString *paperType = [subDic valueForKey:@"paperType"];
//        if (![papers containsObject:paperType]) {
//            [papers addObject:paperType];
//        }
//        
//       
//        
//    }
//    return papers;
//}

+(NSArray *)arrayOfTitlesWithPaperInfos:(NSArray *)paperInfos {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (PaperInfo *p in paperInfos) {
        [arr addObject:p.title];
    }
    return arr;
}
+(NSArray *)arrayOfTypesWithPaperInfos:(NSArray *)paperInfos {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (PaperInfo *p in paperInfos) {
        if (![arr containsObject:p.paperType]) {
           [arr addObject:p.paperType];
        }
        
    }
    return arr;
}
@end
