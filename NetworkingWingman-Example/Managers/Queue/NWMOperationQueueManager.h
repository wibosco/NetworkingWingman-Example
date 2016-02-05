//
//  NWMOperationQueueManager.h
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 This class coordinates the operations.
 */
@interface NWMOperationQueueManager : NSObject

/**
 Returns the global NWMOperationQueueManager instance.
 
 @return NWMOperationQueueManager instance.
 */
+ (instancetype)sharedInstance;

/**
 Add an operation to an operation queue.
 
 @param operation - the new operation to be added.
 */
- (void)addOperation:(NSOperation *)operation;

@end
