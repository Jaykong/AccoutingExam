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
    _scrollView.bounces = NO;
    CGFloat scrollX = _scrollView.bounds.origin.x;
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
    _tableview1.dataSource = self;
    _tableview2.dataSource = self;
    _tableview3.dataSource = self;
    [_scrollView addSubview:_tableview1];
    [_scrollView addSubview:_tableview2];
    [_scrollView addSubview:_tableview3];
}
-(instancetype)initPaperView {
    self = [super init];
    if (self) {
        
        CGFloat scrollX = _scrollView.bounds.origin.x;
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
        _tableview3.frame = CGRectMake(scrollX + width * 2, scrollY, width, height);
        _tableview1.dataSource = self;
        [_scrollView addSubview:_tableview1];
       // [_scrollView addSubview:_tableview2];
       // [_scrollView addSubview:_tableview3];
        
        
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = @"test";
    return cell;
}

@end
