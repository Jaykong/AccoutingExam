//
//  PracticeScrollViewController.m
//  AccountingExam
//
//  Created by kongyunpeng on 12/17/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "PracticeScrollViewController.h"
#import "QuestionOption.h"
#import "ProgressHUD.h"
@implementation PracticeScrollViewController
{
    NSArray *questions;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [ProgressHUD show:@"加载中"];
    self.numbersOfSection = 2;
    
    NSArray *quesArr = [JsonDataManager getQuestionsWithPaperID:_paperInfo.paperID];
    JsonDataRequest *jsonData;
    jsonData = [[JsonDataRequest alloc] init];
    if (quesArr.count == 0) {
        [jsonData insertQuestionsFromServerWithPaperID:_paperInfo.paperID];
        jsonData.delegate = self;

   } else {
      [self DidFinishingLoading:nil];
   }
   
    
    
    
    
    _practiceScrollView.frame = CGRectMake(_practiceScrollView.frame.origin.x, _practiceScrollView.frame.origin.y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    CGFloat height = _practiceScrollView.frame.size.height;
    CGFloat width = _practiceScrollView.frame.size.width;
    _tableView = [[CopyTableView alloc] initWithFrame:_practiceScrollView.frame style:UITableViewStylePlain];
    
    _tableView.frame = CGRectMake(0, 0, width, height);
    _tableView2 = [_tableView copy];
    _tableView3 = [_tableView copy];
    
   
    [_practiceScrollView addSubview:_tableView];
    
     _tableView2.frame = CGRectMake(width, 0, width, height);
    [_practiceScrollView addSubview:_tableView2];
    
     _tableView3.frame = CGRectMake(2 * width, 0, width, height);
    [_practiceScrollView addSubview:_tableView3];
    
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;

    
    _practiceScrollView.contentSize = CGSizeMake(3 * width, height);
    _practiceScrollView.pagingEnabled = YES;
    _practiceScrollView.delegate = self;
    _practiceScrollView.contentOffset = CGPointMake(width, 0);
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
 }


-(void)reloadAllTableViews {
    [_tableView2 reloadData];
    [_tableView reloadData];
    [_tableView3 reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _practiceScrollView) {
        if (scrollView.contentOffset.x == 0) {
            --_prePage;
            --_currentPage;
            --_nextPage;
            [self validAllPages];
            [self reloadAllTableViews];
            scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
            }
        
        if (scrollView.contentOffset.x == scrollView.frame.size.width * 2) {
            ++_prePage;
            ++_currentPage;
            ++_nextPage;
           [self validAllPages];
           [self reloadAllTableViews];
            scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
        }
        
        
    }
}
- (IBAction)lastBtnClicked:(UIBarButtonItem *)sender {
    --_prePage;
    --_currentPage;
    --_nextPage;
   [self validAllPages];
   [self reloadAllTableViews];
    
}

- (IBAction)nextBtnClicked:(id)sender {
    ++_prePage;
    ++_currentPage;
    ++_nextPage;
    [self validAllPages];
    [self reloadAllTableViews];
}

- (IBAction)checkBtnClicked:(id)sender {
    [self submitAnswerWithIndexPath:nil isChecked:YES];
    [self reloadAllTableViews];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:@"bookmark"] forState:UIControlStateNormal];
   // [btn setTitle:@"收藏" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(bookmarkPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem =
    [[UIBarButtonItem alloc] initWithCustomView:btn];
    _checkBarBtn = btnItem;
    NSArray *items = [NSArray arrayWithObjects:_lastBarBtn,_flexibleBarBtn,_checkBarBtn,_flexibleBarBtn,_nextBarBtn,nil];
    [_toolbar setItems:items animated:YES];
    
    
    
}
-(void)bookmarkPressed {
    
}
-(void)DidFinishingLoading:(JsonDataRequest *)jsonData {
    
//[JsonDataManager insertAllQuestions:jsonData.jsonArr];
    
   // sleep(4);
    
questions = [JsonDataManager getQuestionsWithPaperID:_paperInfo.paperID];
    
self.questionTitles = [NSArray arrayOfTitlesWithQuestions:questions];
    
self.questionOptions =  [NSArray arrayOfOptionsWithQuestions:questions];
    
    self.currentPage = 0;
    self.prePage = -1;
    self.nextPage = 1;
    [self validAllPages];
    _practiceScrollView.contentOffset = CGPointMake(_practiceScrollView.frame.size.width, 0);
    

    dispatch_async(dispatch_get_main_queue(), ^{
        [self reloadAllTableViews];
        [ProgressHUD dismiss];
        
    });
    
    
}
-(void)validAllPages{
    self.currentPage = [self validPage:self.currentPage];
    self.prePage =  [self validPage:self.prePage];
    self.nextPage =  [self validPage:self.nextPage];
}

-(NSInteger)validPage:(NSInteger)page {
    if (page == -1) {
        return self.questionTitles.count - 1;
    }
    if (page == self.questionTitles.count ) {
        return 0;
    }
    return page;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _numbersOfSection;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return  1;
    } else {
        [self setupReusePage:tableView];
        NSArray *option = [_questionOptions objectAtIndex:_reusePage];
       
        return option.count;
    }
    
}
-(void)submitAnswerWithIndexPath:(NSIndexPath *)indexPath isChecked:(BOOL) isChecked{
    NSArray *option = [_questionOptions objectAtIndex:_currentPage];
    
    if (option.count != 0) {
        
        Question *q = [questions objectAtIndex:_currentPage];
        if (isChecked) {
            q.userAnswer = @" ";
        } else {
        QuestionOption *optionElement = [option objectAtIndex:indexPath.row];
        q.userAnswer = optionElement.optionContent;
        }
        NSLog(@"%@",q.userAnswer);
        
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (tableView == _tableView2) {
        if (indexPath.section == 1) {
            [self submitAnswerWithIndexPath:indexPath isChecked:NO];
                
            }
            
            
            
        
        
        [self reloadAllTableViews];
    }
    
}
-(void)setupReusePage:(UITableView *)tableView{
    
    if (tableView == _tableView) {
        _reusePage = _prePage;
    }
    if (tableView == _tableView2) {
        _reusePage = _currentPage;
    }
    
    if (tableView == _tableView3) {
        _reusePage = _nextPage;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self setupReusePage:tableView];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (indexPath.section == 0) {
       
        cell.textLabel.text = [_questionTitles objectAtIndex:_reusePage];
        
    } else {
     
       NSArray *option = [_questionOptions objectAtIndex:_reusePage];
       
        if (indexPath.row < option.count) {
          QuestionOption *optionElement = [option objectAtIndex:indexPath.row];
            
            Question *q = [questions objectAtIndex:_reusePage];
//            if ([q.answer isEqualToString:q.userAnswer]) {
//                
//            }
           // NSLog(@"%@",q.userAnswer);
            if (q.userAnswer == nil) {
                cell.accessoryType = UITableViewCellAccessoryNone;
            } else {
                
                if ([q.userAnswer isEqualToString:optionElement.optionContent]) {
                   cell.accessoryType = UITableViewCellAccessoryCheckmark;
                } else {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
            
          cell.textLabel.text = optionElement.optionContent;
        } else {
          cell.textLabel.text = @"服务器数据错误";
        }
        
        
       
    }
    
    return cell;
    
}


@end
