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
    NSInteger currentPage;
}

#pragma mark - last next Operations
-(void)lastBtnClicked {
    --currentPage;
    if (currentPage == -1) {
        currentPage = questionTitles.count - 1;
    }
    [_tableview reloadData];
}
-(void)nextBtnClicked {
    ++currentPage;
    if (currentPage == questionTitles.count) {
        currentPage = 0;
    }
    [_tableview reloadData];
    
}
-(void)configureToolbar {
  //  UIBarButtonItem *lastBtn = [UIBarButtonItem alloc]initWithTitle:@"上一题" style: target:self action:@selector(lastBtnClicked)];
    //UIBarButtonItem *lastBtn = [[UIBarButtonItem alloc]initWithTitle:@"上一题" style:UIBarButtonItemStylePlain target:self action:@selector(lastBtnClicked)];
    
    
    UIBarButtonItem *lastBtn1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"last"] style:UIBarButtonSystemItemAction target:self action:@selector(lastBtnClicked)];
    UIBarButtonItem *checkBtn = [[UIBarButtonItem alloc]initWithTitle:@"查看" style:UIBarButtonItemStylePlain target:self action:@selector(checkBtnClicked)];
   // UIBarButtonItem *nextBtn = [[UIBarButtonItem alloc]initWithTitle:@"下一题" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnClicked)];
    
     UIBarButtonItem *nextBtn2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"next"] style:UIBarButtonSystemItemAction target:self action:@selector(nextBtnClicked)];
    UIBarButtonItem *flexiableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *items = [NSArray arrayWithObjects:lastBtn1,flexiableItem,checkBtn,flexiableItem,nextBtn2, nil];
    [_toolbar setItems:items animated:YES];
    
}
-(void)viewDidLoad {
    [super viewDidLoad];
    currentPage = 0;
    self.title = _paperInfo.title;
    [ProgressHUD show:@"loading..."];
    JsonData *jsonData = [[JsonData alloc] init];
    [jsonData getQuestionsWithPaperID:_paperInfo.paperID];
    jsonData.delegate = self;
    
    
}
-(void)DidFinishingLoading:(JsonData *)jsonData {
    
    JsonDataManager *manager = [[JsonDataManager alloc] init];
    [manager insertAllQuestions:jsonData.jsonArr];
    NSArray *questions = [manager getQuestions];
    questionTitles = [NSArray arrayOfTitlesWithQuestions:questions];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableview reloadData];
        [ProgressHUD dismiss];
        [self configureToolbar];

    }) ;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return  1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [questionTitles objectAtIndex:currentPage];
    return cell;
    
}
@end
