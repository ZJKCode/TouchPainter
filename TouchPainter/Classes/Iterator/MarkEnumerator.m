//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator+Internal.h"

@implementation MarkEnumerator

- (NSArray *)allObjects
{
    return [[stack_ reverseObjectEnumerator] allObjects];
    
}
- (id)nextObject
{
    return [stack_ pop];
}

#pragma mark -
#pragma mark Private Methods

- (id)initWithMark:(id<Mark>)aMark
{
    if (self = [super init]) {
        stack_ = [[NSMutableArray alloc] initWithCapacity:[aMark count]];
        [self traverseAndBuildStackWithMark:aMark];
    }
    return self;
}

- (void) traverseAndBuildStackWithMark:(id<Mark>)mark
{
    if (mark == nil) {
        return;
    }
    [stack_ push:mark];
    NSUInteger index = [mark count];
    id <Mark>childMark;
    while ((childMark = [mark childMarkAtIndex:--index])) {
        [self traverseAndBuildStackWithMark:childMark];
        
    }

}
@end
