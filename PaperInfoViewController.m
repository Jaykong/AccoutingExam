//
//  PaperInfoViewController.m
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//
#import "ProgressHUD.h"
#import "PaperInfoViewController.h"
#import "JsonDataManager.h"
#import "NSArray+JsonDataFormating.h"
@interface PaperInfoViewController ()
{
  
    NSArray *paperTitles;
    NSArray *paperTypes;
}
@end

@implementation PaperInfoViewController
@synthesize paperView = paperView;
-(void)getPaperViewFromNibAndConfigure{
//    UINib *nib = [UINib nibWithNibName:@"PaperView" bundle:nil];
//    NSArray *nibs = [nib instantiateWithOwner:self options:nil];
//    paperView = [nibs objectAtIndex:0];
    [paperView addPaperView];
    paperView.tableview1.delegate = self;
    paperView.tableview1.dataSource = self;
    paperView.tableview2.delegate = self;
    paperView.tableview2.dataSource = self;
    paperView.tableview3.delegate = self;
    paperView.tableview3.dataSource = self;
    
   
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [ProgressHUD show:@"加载中..."];
    
    [self getPaperViewFromNibAndConfigure];
   // self.view = paperView ;
    
    JsonData *jsonData = [[JsonData alloc] init];
    
    [jsonData getPapers];
    jsonData.delegate = self;
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reConfigurePaperView {
    for (int i = 0; i < paperTypes.count; ++i) {
        [paperView.segmentControl setTitle:[paperTypes objectAtIndex:i] forSegmentAtIndex:i];
    }
    
    [paperView.tableview1 reloadData];
    [paperView.tableview2 reloadData];
    [paperView.tableview3 reloadData];
    [ProgressHUD  dismiss];

}

-(void)DidFinishingLoading:(JsonData *)jsonData{
    JsonDataManager *manager = [[JsonDataManager alloc] init];
    [manager insertAllPapers:jsonData.jsonArr];
    
    NSArray *paperInfos = [manager getPaperInfos];
   paperTitles = [NSArray arrayOfTitlesWithPaperInfos:paperInfos];
    
//    paperTitles = [NSArray returnPaperTitlesFromJsonArray:jsonData.jsonArr];
//    paperTypes = [NSArray returnPaperTypesFromJsonArray:jsonData.jsonArr];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self reConfigurePaperView];
    });
    
}
#pragma mark - Tableview DataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [paperTitles count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const Cell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.textLabel.text = [paperTitles objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Scrollview Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"%f",scrollView.contentOffset.x);
    CGFloat width = [[UIScreen mainScreen]bounds].size.width;
    //CGFloat version =  [[[UIDevice currentDevice] ]floatValue];
   
  //@"iPhone 4S"
    
    
        if (scrollView.contentOffset.x < width) {
            paperView.segmentControl.selectedSegmentIndex = 0;
            
        }
        if (scrollView.contentOffset.x >= width) {
            paperView.segmentControl.selectedSegmentIndex = 1;
            
        }
        
        if (scrollView.contentOffset.x >= 2 * width) {
            paperView.segmentControl.selectedSegmentIndex = 2;
        }
        
    
    
   
    
    
    
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
