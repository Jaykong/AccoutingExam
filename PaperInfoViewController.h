//
//  PaperInfoViewController.h
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonDataRequest.h"
#import "PaperView.h"
#import "PracticeScrollViewController.h"
@interface PaperInfoViewController : UIViewController<JsonDataDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet PaperView *paperView;
@property (nonatomic,strong) NSArray *paperTitles;
@property (nonatomic,strong) NSArray *paperTypes;
@property (nonatomic,strong)NSArray *paperInfos;
@property (nonatomic, strong)PracticeScrollViewController *controller;

-(void)getPaperViewFromNibAndConfigure;
@end
