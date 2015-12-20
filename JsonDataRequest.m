//
//  JsonData.m
//  AccountingExam
//
//  Created by trainer on 12/2/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "JsonDataRequest.h"
#import "PracticeDataModel.h"
@implementation JsonDataRequest
//@"http://112.124.122.38/acountingExam/getPaperInfo.php"
//http://112.124.122.38/acountingExam/getQuestions.php

-(void)getPapersFromServer{
   
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getPaperInfo.php"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *jsonArr =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!jsonArr) {
            NSLog(@"Json Serializtion error:%@",error.description);
            
        } else {
            _jsonArr = jsonArr;
            //JsonDataManager *jsonDataManager = [[JsonDataManager alloc] init];
            
            [_delegate DidFinishingLoading:self];
            
        }
       
    }];
    
    [task resume];
}

-(void)insertQuestionsFromServerWithPaperID:(NSString*) paperID {
    {
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/getQuestions.php"];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        NSString *para = [NSString stringWithFormat:@"paperID=%@",paperID] ;
        request.HTTPMethod = @"POST";
        request.HTTPBody = [para dataUsingEncoding:NSUTF8StringEncoding];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           // NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
          //  NSLog(@"%@",str);
            
            NSArray *jSONArr =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!jSONArr) {
                NSLog(@"Json Serializtion error:%@",error.description);
                
            } else {
                //JsonDataManager *manager = [[JsonDataManager alloc] init];
               // _jsonArr = jSONArr;
                [JsonDataManager insertAllQuestions:jSONArr];
                
                [_delegate DidFinishingLoading:self];
                
            }
            
        }];
        
        [task resume];
    }
}
@end
