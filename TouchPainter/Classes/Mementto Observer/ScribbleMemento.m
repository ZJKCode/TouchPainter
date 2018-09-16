//
//  ScribbleMemento.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@implementation ScribbleMemento

@synthesize mark = mark_;
@synthesize hasComleteSnapshot = hasCompleteSnapshot_;

- (NSData *)data
{
   // 将mark 数据持久化为Data
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mark_];
    return data;
    
}



+ (ScribbleMemento *) mementoWithData:(NSData *)data
{
    //It raises an NSInvalidArchiveOperationException
    //if data is not a valid archive
    // 将数据反序列化为mark
    id <Mark> retoredMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];

    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:retoredMark];
   
    return memento;

}
#pragma mark -
#pragma mark Provate methods

- (id) initWithMark:(id<Mark>)aMark
{
    if (self = [super init]) {
        [self setMark: aMark];
    }
    return self;
}
@end
