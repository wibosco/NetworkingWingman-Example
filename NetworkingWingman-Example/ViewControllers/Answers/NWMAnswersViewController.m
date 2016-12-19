//
//  ViewController.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMAnswersViewController.h"

#import "NWMAnswersAPIManager.h"
#import "NWMAnswer.h"
#import "NWMAnswerTableViewCell.h"

@interface NWMAnswersViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<NWMAnswer *> *answers;

@end

@implementation NWMAnswersViewController

#pragma mark - Viewlifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [NWMAnswersAPIManager retrieveAnswersWithCompletion:^(NSArray *answers)
    {
        self.answers = answers;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.answers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NWMAnswerTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([NWMAnswerTableViewCell class]) forIndexPath:indexPath];
    
    NWMAnswer *answer = self.answers[indexPath.row];
    tableViewCell.answerIDLabel.text = [NSString stringWithFormat:@"%@", answer.answerID];
    
    return tableViewCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}

@end
