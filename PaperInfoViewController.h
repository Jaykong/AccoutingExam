//
//  PaperInfoViewController.h
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonData.h"
#import "PaperView.h"
@interface PaperInfoViewController : UIViewController<JsonDataDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet PaperView *paperView;

@end
