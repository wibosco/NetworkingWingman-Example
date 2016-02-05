//
//  NWMAnswersRetrievalOperation.h
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMOperation.h"

@interface NWMAnswersRetrievalOperation : NWMOperation

/**
 Init for creating `NWMAnswersRetrievalOperation` instance with the completion block.
 
 @param completion - block that will be called once network request has been completed. Will return an array of answers or nil.
 
 @return `NWMAnswersRetrievalOperation` instance.
 */
- (instancetype)initWithCompletion:(void (^)(NSArray *answers))completion;

@end
