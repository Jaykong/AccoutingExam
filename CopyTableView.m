//
//  CopyTableView.m
//  AccountingExam
//
//  Created by kongyunpeng on 12/17/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "CopyTableView.h"

@implementation CopyTableView

-(id)copyWithZone:(NSZone *)zone {
    CopyTableView *copy = [[[CopyTableView class] allocWithZone:zone] init];
    
    return  copy;
}

@end
