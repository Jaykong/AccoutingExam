//
//  PaperView.h
//  AccountingExam
//
//  Created by kongyunpeng on 12/1/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaperView : UIView
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property UITableView *tableview1;
@property UITableView *tableview2;
@property UITableView *tableview3;
-(void)setUpSegmentControl:(NSArray *)paperTypes;
-(void)addPaperView;
@end
