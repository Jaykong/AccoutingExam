//
//  WrongQuestionViewController.m
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "WrongQuestionViewController.h"

@interface WrongQuestionViewController ()
{
    NSArray *wrongCounts;
}

@end

@implementation WrongQuestionViewController
-(NSArray *)generateBookmarkCounts {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (PaperInfo *p in self.paperInfos) {
        self.bookmarkCount = (int)[[JsonDataManager getQuestionsWithPaperID:p.paperID isWrong:YES] count];
        
        
        [arr addObject:[NSNumber numberWithInt:self.bookmarkCount]];
        
    }
    return arr;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    wrongCounts = [self generateBookmarkCounts] ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [super tableView:tableView numberOfRowsInSection:section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 44, 0, 30, 30)];
    lbl.layer.cornerRadius = 20;
    lbl.backgroundColor = [UIColor lightGrayColor];
    lbl.textColor = [UIColor redColor];
    lbl.text = [NSString stringWithFormat:@"%@",wrongCounts[indexPath.row]];
    
    [cell.contentView addSubview:lbl];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    self.controller.practiceType = Wrong;
    
}

@end
