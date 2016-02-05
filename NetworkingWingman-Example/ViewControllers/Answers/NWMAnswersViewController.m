//
//  ViewController.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMAnswersViewController.h"

#import "NWMAnswersAPIManager.h"

@interface NWMAnswersViewController ()

@end

@implementation NWMAnswersViewController

#pragma mark - Viewlifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [NWMAnswersAPIManager retrieveAnswersWithCompletion:^(NSArray *answers)
    {
        //nil
    }];
}

@end
