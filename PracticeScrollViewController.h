//
//  PracticeScrollViewController.h
//  AccountingExam
//
//  Created by kongyunpeng on 12/17/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CopyTableView.h"
#import "Question.h"
#import "JsonDataRequest.h"
#import "NSArray+JsonDataFormating.h"
@interface PracticeScrollViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JsonDataDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *practiceScrollView;

@property (nonatomic,strong) CopyTableView *tableView;
@property (nonatomic,strong) UITableView *tableView2;
@property (nonatomic,strong) UITableView *tableView3;

@property (nonatomic,strong) IBOutlet UIToolbar *toolbar;

@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger prePage;
@property (nonatomic,assign) NSInteger nextPage;
@property (nonatomic,assign) NSInteger reusePage;
@property (nonatomic,assign) NSInteger numbersOfSection;

@property (nonatomic,strong) NSArray *questionTitles;
@property (nonatomic,strong) NSArray *questionOptions;

-(void)reloadAllTableViews;
@property(nonatomic, strong) PaperInfo *paperInfo;
@end
