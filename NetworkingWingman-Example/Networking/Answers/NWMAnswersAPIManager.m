//
//  NWMAnswersAPIManager.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMAnswersAPIManager.h"

#import "NWMAnswersRetrievalOperation.h"
#import "NWMOperationQueueManager.h"

@implementation NWMAnswersAPIManager

#pragma mark - Retrieval

+ (void)retrieveAnswersWithCompletion:(void (^)(NSArray *answers))completion
{
    NWMAnswersRetrievalOperation *operation = [[NWMAnswersRetrievalOperation alloc] initWithCompletion:completion];
    
    [[NWMOperationQueueManager sharedInstance] addOperation:operation];
}

@end
