//
//  PracticeViewController.h
//  AccountingExam
//
//  Created by trainer on 12/9/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperInfo.h"
#import "JsonData.h"
@interface PracticeViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,JsonDataDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic, strong) PaperInfo *paperInfo;


@end
