//
//  NWMOperation.m
//  NetworkingWingman-Example
//
//  Created by William Boles on 05/02/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

#import "NWMOperation.h"

@interface NWMOperation ()

@property (nonatomic, strong) NSRecursiveLock *stateLock;

@end

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
        self.stateLock = [[NSRecursiveLock alloc] init];
        self.ready = YES;
    }

    return self;
}

#pragma mark - State

- (void)setReady:(BOOL)ready
{
    [self.stateLock lock];

    if (_ready != ready)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isReady))];
        _ready = ready;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isReady))];
    }

    [self.stateLock unlock];
}

- (BOOL)isReady
{
    [self.stateLock lock];
    BOOL result = [super isReady] && _ready;
    [self.stateLock unlock];

    return result;
}

- (void)setExecuting:(BOOL)executing
{
    [self.stateLock lock];

    if (_executing != executing)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
        _executing = executing;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isExecuting))];
    }

    [self.stateLock unlock];
}

- (BOOL)isExecuting
{
    [self.stateLock lock];
    BOOL result = _executing;
    [self.stateLock unlock];

    return result;
}

- (void)setFinished:(BOOL)finished
{
    [self.stateLock lock];

    if (_finished != finished)
    {
        [self willChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
        _finished = finished;
        [self didChangeValueForKey:NSStringFromSelector(@selector(isFinished))];
    }

    [self.stateLock unlock];
}

- (BOOL)isFinished
{
    [self.stateLock lock];
    BOOL result = _finished;
    [self.stateLock unlock];

    return result;
}

#pragma mark - Start

- (void)start
{
    [self.stateLock lock];

    if (self.isCancelled)
    {
        [self finish];
        [self.stateLock unlock];
        return;
    }

    if (!self.isExecuting)
    {
        self.ready = NO;
        self.executing = YES;
        self.finished = NO;
    }

    [self.stateLock unlock];
}

#pragma mark - Finish

- (void)finish
{
    [self.stateLock lock];

    if (self.executing)
    {
        self.executing = NO;
        self.finished = YES;
    }

    [self.stateLock unlock];
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
