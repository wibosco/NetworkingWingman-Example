//
//  NWMAnswerParser.h
//  NetworkingWingman-Example
//
//  Created by William Boles on 19/12/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NWMAnswer;

@interface NWMAnswerParser : NSObject

/**
 Parses answers.
 
 @param answersDictionaries - array containing answers in JSON format.
 
 @return an array with answers
 */
- (NSArray<NWMAnswer *> *)parseAnswers:(NSArray *)answersDictionaries;

@end
