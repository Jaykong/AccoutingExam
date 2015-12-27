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
#import "BaiduMobAdView.h"
#import "BaiduMobAdCommonConfig.h"
typedef enum {
    BookMark,Wrong,Practice
} PracticeType;
@protocol PracticeScrollViewControllerDelegate ;

@interface PracticeScrollViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JsonDataDelegate,BaiduMobAdViewDelegate>
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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBarBtn;
@property (nonatomic,strong) NSArray *questionOptions;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *lastBarBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *flexibleBarBtn;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *checkBarBtn;
-(void)reloadAllTableViews;

@property(nonatomic, strong) PaperInfo *paperInfo;
@property (nonatomic,assign)PracticeType practiceType;

@end
typedef enum {
    Check, Bookmarked,NotBookmarked
} MiddleItemInToolbarStatus;



