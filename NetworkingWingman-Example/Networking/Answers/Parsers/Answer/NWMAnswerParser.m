//
//  NWMAnswerParser.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 19/12/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMAnswerParser.h"

#import "NWMAnswer.h"

@interface NWMAnswerParser ()

/**
 Parses answer.
 
 @param answerDictionary - dictionary containing an answer in JSON format.
 
 @return an answer.
 */
- (NWMAnswer *)parserAnswer:(NSDictionary *)answerDictionary;

@end

@implementation NWMAnswerParser

#pragma mark - Parsing

- (NSArray<NWMAnswer *> *)parseAnswers:(NSArray *)answersDictionaries
{
    NSMutableArray *answers = [[NSMutableArray alloc] init];
    
    for (NSDictionary *answerDictionary in answersDictionaries)
    {
        NWMAnswer *answer = [self parserAnswer:answerDictionary];
        [answers addObject:answer];
    }
    
    return [answers copy];
}

- (NWMAnswer *)parserAnswer:(NSDictionary *)answerDictionary
{
    NWMAnswer *answer = [[NWMAnswer alloc] init];
    answer.answerID = answerDictionary[@"answer_id"];
    
    return answer;
}

@end
