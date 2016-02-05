//
//  NWMOperationQueueManager.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMOperationQueueManager.h"

@interface NWMOperationQueueManager ()

/**
 NSOperationQueue that operations will be added to.
 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation NWMOperationQueueManager

#pragma mark - SharedInstance

+ (instancetype)sharedInstance
{
    static NWMOperationQueueManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[NWMOperationQueueManager alloc] init];
                  });
    
    return sharedInstance;
}

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.queue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

#pragma mark - AddOperation

- (void)addOperation:(NSOperation *)operation
{
    [self.queue addOperation:operation];
}

@end
