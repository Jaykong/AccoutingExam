//
//  PaperView.m
//  AccountingExam
//
//  Created by kongyunpeng on 12/1/15.
//  Copyright © 2015 trainer. All rights reserved.
//

#import "PaperView.h"

@implementation PaperView


-(void)addPaperView {
    _scrollView.pagingEnabled = YES;
   // _scrollView.alwaysBounceHorizontal = YES;
   _scrollView.alwaysBounceVertical=NO;
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    CGFloat scrollX = 0;
    CGFloat scrollY =  _scrollView.bounds.origin.y;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    _scrollView.contentSize = CGSizeMake(3 * width, height);
    _scrollView.frame = CGRectMake(scrollX,scrollY , width, height);
    
    _tableview1 = [[UITableView alloc] initWithFrame:_scrollView.bounds style:UITableViewStylePlain];
    
    _tableview1.frame = CGRectMake(scrollX, scrollY, width, height);
    _tableview2 = [[UITableView alloc] initWithFrame:_scrollView.bounds style:UITableViewStylePlain];
    _tableview2.frame = CGRectMake(scrollX + width, scrollY, width, height);
    _tableview3 = [[UITableView alloc] initWithFrame:_scrollView.bounds style:UITableViewStylePlain];
    _tableview3.frame = CGRectMake(scrollX + 2 * width, scrollY, width, height);
    
    _tableview1.translatesAutoresizingMaskIntoConstraints = NO;
    _tableview2.translatesAutoresizingMaskIntoConstraints = NO;
    _tableview3.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:_tableview1];
    [_scrollView addSubview:_tableview2];
    [_scrollView addSubview:_tableview3];
    
  /*  NSDictionary *_tableviewMap = @{@"tableview1":_tableview1,@"tableview2":_tableview2,@"tableview3":_tableview3};
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tableview1]-[tableview2]" options:0 metrics:nil views:_tableviewMap];
    NSArray *verticalConstraints =[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[tableview1]-0-|" options:0 metrics:nil views:_tableviewMap];
    
    [_scrollView addConstraints:horizontalConstraints];
    [_scrollView addConstraints:verticalConstraints];
    
    NSArray *horizontalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tableview1]-[tableview2]-[tableview3]" options:0 metrics:nil views:_tableviewMap];
    NSArray *verticalConstraints2 =[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[tableview2]-0-|" options:0 metrics:nil views:_tableviewMap];
    [_scrollView addConstraints:horizontalConstraints2];
    [_scrollView addConstraints:verticalConstraints2];
    
    NSArray *horizontalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat:@"H:[tableview2]-[tableview3]-|" options:0 metrics:nil views:_tableviewMap];
    NSArray *verticalConstraints3 =[NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[tableview2]-0-|" options:0 metrics:nil views:_tableviewMap];
    [_scrollView addConstraints:horizontalConstraints3];
    [_scrollView addConstraints:verticalConstraints3];
    */
   
}

@end
