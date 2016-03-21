//
//  DemoTableViewController.m
//  UITableViewCell-Animation
//
//  Created by Vincent on 3/17/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DemoTableViewCell.h"
#import "DemoModel.h"
#import "AnimationHelper.h"

#define CellReuseID @"DemoTableViewCell"


@interface DemoTableViewController ()
@property (nonatomic, strong) NSArray<DemoModel *> *dataSource;
@property (nonatomic) CGPoint lastOffset;
@property (nonatomic, getter=isScrollingUpward) BOOL scrollingUpward;
@end

@implementation DemoTableViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [self dataSource];
    
    // Register .xib file.
    UITableView *tableView = (UITableView *)self.view;
    [tableView registerNib:[UINib nibWithNibName:@"DemoTableViewCell" bundle:nil] forCellReuseIdentifier:CellReuseID];
}

#pragma mark - Data
- (NSArray *)dataSource {
    NSMutableArray<DemoModel *> *dataSource = [NSMutableArray array];
    NSArray *icons = @[@"fish", @"amaz"];
    for (int i = 0; i < 30; i ++) {
        DemoModel *model = [[DemoModel alloc] init];
        model.name = [NSString stringWithFormat:@"David--%02d", i];
        model.icon = icons[i % icons.count];
        [dataSource addObject:model];
    }
    return dataSource;
}

#pragma mark - Delegate Methods
#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseID forIndexPath:indexPath];
    
    // Configure the cell.
    DemoModel *model = self.dataSource[indexPath.row];
    [cell setIcon:model.icon name:model.name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [AnimationHelper animateRotationOnZAxisForCell:cell clockwise:self.isScrollingUpward];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint currentOffset = scrollView.contentOffset;
    self.scrollingUpward = currentOffset.y > self.lastOffset.y;
    self.lastOffset = currentOffset;
}

@end
