//
//  BookmarkQuestionViewController.h
//  AccountingExam
//
//  Created by trainer on 11/23/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaperInfoViewController.h"
#import "PracticeScrollViewController.h"
@interface BookmarkQuestionViewController :PaperInfoViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign)int bookmarkCount;


@end
