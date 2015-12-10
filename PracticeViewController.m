//
//  PracticeViewController.m
//  AccountingExam
//
//  Created by trainer on 12/9/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "PracticeViewController.h"
#import "ProgressHUD.h"
#import "JsonDataManager.h"
#import "JsonData.h"
#import "NSArray+JsonDataFormating.h"
@implementation PracticeViewController
{
    NSArray *questionTitles;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    self.title = _paperInfo.title;
    [ProgressHUD show:@"loading..."];
    JsonData *jsonData = [[JsonData alloc] init];
    [jsonData getQuestionsWithPaperID:_paperInfo.paperID];
    jsonData.delegate = self;
    
    
}
-(void)DidFinishingLoading:(JsonData *)jsonData {
    [ProgressHUD dismiss];
    JsonDataManager *manager = [[JsonDataManager alloc] init];
    [manager insertAllQuestions:jsonData.jsonArr];
    NSArray *questions = [manager getQuestions];
    questionTitles = [NSArray arrayOfTitlesWithQuestions:questions];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableview reloadData];

    }) ;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return  [questionTitles count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [questionTitles objectAtIndex:indexPath.row];
    return cell;
    
}
@end
