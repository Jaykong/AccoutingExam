//
//  NSArray+JsonDataFormating.h
//  NSsession
//
//  Created by kongyunpeng on 11/28/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (JsonDataFormating)

+(NSArray *)returnPaperTitlesFromJsonArray:(NSArray *)parentArr;
+(NSArray *)returnPaperTypesFromJsonArray:(NSArray *)parentArr;
@end
