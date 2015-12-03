//
//  NSArray+JsonDataFormating.m
//  NSsession
//
//  Created by kongyunpeng on 11/28/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "NSArray+JsonDataFormating.h"

@implementation NSArray(JsonDataFormating)
+(NSArray *)returnPaperTitlesFromJsonArray:(NSArray *)parentArr{
    NSMutableArray *papers = [[NSMutableArray alloc] init];
    for (NSDictionary *subDic in parentArr) {
        
        [papers addObject:[subDic valueForKey:@"title"]];
        
    }
    return papers;
}

+(NSArray *)returnPaperTypesFromJsonArray:(NSArray *)parentArr {
    NSMutableArray *papers = [[NSMutableArray alloc] init];
    for (NSDictionary *subDic in parentArr) {
        NSString *paperType = [subDic valueForKey:@"paperType"];
        if (![papers containsObject:paperType]) {
            [papers addObject:paperType];
        }
        
       
        
    }
    return papers;
}
@end
