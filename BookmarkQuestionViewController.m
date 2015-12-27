//
//  BookmarkQuestionViewController.m
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "BookmarkQuestionViewController.h"
#import "JsonDataManager.h"
#import "NSArray+JsonDataFormating.h"
@interface BookmarkQuestionViewController ()
{
    NSArray *bkCounts;
}
@end

@implementation BookmarkQuestionViewController


-(NSArray *)generateBookmarkCounts {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (PaperInfo *p in self.paperInfos) {
        _bookmarkCount = (int)[[JsonDataManager getQuestionsWithPaperID:p.paperID bookmared:YES] count];
        
       
        [arr addObject:[NSNumber numberWithInt:_bookmarkCount]];
        
    }
    return arr;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.paperInfos = [JsonDataManager getPaperInfos];
    self.paperTitles = [NSArray arrayOfTitlesWithPaperInfos:self.paperInfos];
    self.paperTypes = [NSArray arrayOfTypesWithPaperInfos:self.paperInfos];
    
    bkCounts = [self generateBookmarkCounts];
    
       [self.paperView addPaperView];
    
    
        self.paperView.tableview1.delegate = self;
        self.paperView.tableview1.dataSource = self;
    
        self.paperView.tableview2.delegate = self;
        self.paperView.tableview2.dataSource = self;
    
        self.paperView.tableview3.delegate = self;
        self.paperView.tableview3.dataSource = self;
    
    [self.paperView setUpSegmentControl:self.paperTypes];
     //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
//    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PaperView" owner:self options:nil];
//    bkPaperView = nibs[0];
//    [bkPaperView addPaperView];
    

//    bkPaperView.tableview1.delegate = self;
//    bkPaperView.tableview1.dataSource = self;
//    
//    bkPaperView.tableview2.delegate = self;
//    bkPaperView.tableview2.dataSource = self;
//    
//    bkPaperView.tableview3.delegate = self;
//    bkPaperView.tableview3.dataSource = self;
    //[self.view addSubview:bkPaperView];
    //[bkPaperView setUpSegmentControl:self.paperTypes];
   // self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
 // [super viewDidLoad];
  
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


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
    lbl.text = [NSString stringWithFormat:@"%@",bkCounts[indexPath.row]];
    
    [cell.contentView addSubview:lbl];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    self.controller.practiceType = BookMark;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
