//
//  NWMOperation.h
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Abstract class for asynchronus operations.
 */
@interface NWMOperation : NSOperation

/**
 Finishes the execution of the operation.
 
 @note - This shouldn’t be called externally as this is used internally by subclasses. To cancel an operation use cancel instead.
 */
- (void)finish;

@end
