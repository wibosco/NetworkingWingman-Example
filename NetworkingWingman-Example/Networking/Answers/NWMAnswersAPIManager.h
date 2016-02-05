//
//  NWMAnswersAPIManager.h
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Class to handle all API requests related to answers.
 */
@interface NWMAnswersAPIManager : NSObject

/**
 Retrieve answers from API.
 
 @param completion - block that will be called once network request has been completed. Will return an array of answers or nil.
 */
+ (void)retrieveAnswersWithCompletion:(void (^)(NSArray *answers))completion;

@end
