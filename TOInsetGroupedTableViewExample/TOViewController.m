//
//  ViewController.m
//  TOGroupInsetTableView
//
//  Created by Tim Oliver on 2020/04/08.
//  Copyright © 2020 Tim Oliver. All rights reserved.
//

#import "TOViewController.h"
#import "TOInsetGroupedTableView.h"
#import "CustomCell.h"

@interface TOViewController ()

@end

@implementation TOViewController

- (void)loadView
{
    self.tableView = [[TOInsetGroupedTableView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TOInsetGroupedTableView";

	UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
	[self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reload"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(reloadButtonTapped)];
}

- (void)reloadButtonTapped
{
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rows = @[@(3), @(1), @(4), @(5), @(10)];
    return [rows[section] integerValue];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section %ld", (long)section + 1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
    
    return cell;
}

#pragma mark - Table View Data Source -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Enables swipe-to-delete
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}

@end
