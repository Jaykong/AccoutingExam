//
//  JsonData.m
//  AccountingExam
//
//  Created by trainer on 12/2/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData
//@"http://112.124.122.38/acountingExam/getPaperInfo.php"
//http://112.124.122.38/acountingExam/getQuestions.php

-(void)getPapers{
   
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getPaperInfo.php"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *jsonArr =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!jsonArr) {
            NSLog(@"Json Serializtion error:%@",error.description);
            
        } else {
            _jsonArr = jsonArr;
            JsonDataManager *jsonDataManager = [[JsonDataManager alloc] init];
            
            [_delegate DidFinishingLoading:self];
            
            NSLog(@"%@",_jsonArr);
        }
       
    }];
    
    [task resume];
}

-(void)getQuestions {
    {
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getQuestions.php"];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        NSString *para = [NSString stringWithFormat:@"paperID=5659eea5469f3"] ;
        request.HTTPMethod = @"POST";
        request.HTTPBody = [para dataUsingEncoding:NSUTF8StringEncoding];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
            
            NSDictionary *jSONDic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!jSONDic) {
                NSLog(@"Json Serializtion error:%@",error.description);
                
            } else {
                
                NSLog(@"%@",_jsonArr);
            }
            
        }];
        
        [task resume];
    }
}
@end
