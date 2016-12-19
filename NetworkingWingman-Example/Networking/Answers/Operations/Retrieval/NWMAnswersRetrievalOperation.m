//
//  NWMAnswersRetrievalOperation.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMAnswersRetrievalOperation.h"
#import "NWMAnswerParser.h"

@interface NWMAnswersRetrievalOperation ()

/**
 Completion block to be called once the the request and parsing is completed. Will return the parsed answers or nil.
 */
@property (nonatomic, copy) void (^completion)(NSArray *answers);

@end

@implementation NWMAnswersRetrievalOperation

#pragma mark - Init

- (instancetype)initWithCompletion:(void (^)(NSArray *answers))completion
{
    self = [super init];
    
    if (self)
    {
        self.completion = completion;
        self.name = @"Answers-Retrieval";
    }
    
    return self;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://api.stackexchange.com/2.2/answers?site=stackoverflow"];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                  {
                                      NSDictionary *answersJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                                                  options:NSJSONReadingMutableContainers
                                                                                                    error:nil];
                                      
                                      NWMAnswerParser *parser = [[NWMAnswerParser alloc] init];
                                      NSArray *answers = [parser parseAnswers:answersJSON[@"items"]];
                                      
                                      if (self.completion)
                                      {
                                          self.completion(answers);
                                      }
                                      
                                      [self finish];
                                  }];
    
    [task resume];
}

#pragma mark - Cancel

- (void)cancel
{
    [super cancel];
    
    [self finish];
}
@end
