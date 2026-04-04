//
//  NWMOperation.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMOperation.h"

@implementation NWMOperation

@synthesize ready = _ready;
@synthesize executing = _executing;
@synthesize finished = _finished;

#pragma mark - Init

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        self.ready = YES;
    }

    return self;
}

#pragma mark - State

- (void)setReady:(BOOL)ready
{
    if (_ready != ready)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isReady))];
        _ready = ready;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isReady))];
    }
}

- (BOOL)isReady
{
    return [super isReady] && _ready;
}

- (void)setExecuting:(BOOL)executing
{
    if (_executing != executing)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
        _executing = executing;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    }
}

- (BOOL)isExecuting
{
    return _executing;
}

- (void)setFinished:(BOOL)finished
{
    if (_finished != finished)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
        _finished = finished;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    }
}

- (BOOL)isFinished
{
    return _finished;
}

#pragma mark - Start

- (void)start
{
    if (self.isCancelled)
    {
        [self finish];
        return;
    }

    if (!self.isExecuting)
    {
        self.ready = NO;
        self.executing = YES;
        self.finished = NO;
    }
}

#pragma mark - Finish

- (void)finish
{
    if (self.executing)
    {
        self.executing = NO;
        self.finished = YES;
    }
}

#pragma mark - Cancel

- (void)cancel
{
    [super cancel];

    [self finish];
}

#pragma mark - Asynchronous

- (BOOL)isAsynchronous
{
    return YES;
}

@end
