//
//  Scribble.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "Scribble.h"
#import "ScribbleMemento+Friend.h"
#import "Stroke.h"

// A private category for Scribble
// that contains a mark property available
// only to its objects

@interface Scribble ()

@property (nonatomic, retain) id<Mark> mark;

@end
@implementation Scribble

@synthesize mark = parentMark_;

- (id)init
{
    if (self = [super init]) {
        parentMark_ = [[Stroke alloc] init];
        
    }
    return self;
}
#pragma mark -
#pragma mark Methods for Mark management
- (void) addMark:(id<Mark>)mark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark
{

    //manual KVO invocation
    [self willChangeValueForKey:@"mark"];
    
    //if the flag set to YES
    //then add this mark to the
    //PREVIOUS*Mark as part of an
    //aggregate
    //Based on our design ,it's supposed
    // to be the last child of main
    //parent
    if (shouldAddToPreviousMark) {
        [[parentMark_ lastChild] addMark:mark];
        
    }else{//otherwise attach it to the parent
        [parentMark_ addMark:mark];
        incrementalMark_ = mark;
    }
    //manual KVO invocation
    [self didChangeValueForKey:@"mark"];
    
}

- (void)removeMark:(id<Mark>)mark
{

    //do nothing id mark is the parent
    if (mark == parentMark_) {
        return;
    }
    [self willChangeValueForKey:@"mark"];
    [parentMark_ removeMark:mark];
    
    //we don't need to keep the
    // incrementalMark_ reference
    // as it's just remove the parent
    if (mark==incrementalMark_) {
        incrementalMark_ = nil;
    }
    
    //manual KVO invovation
    [self didChangeValueForKey:@"mark"];
    
}
#pragma mark -
#pragma mark - Methods for memento

- (id) initWithMemento:(ScribbleMemento *)aMemento
{
    if (self = [super init]){
        if([aMemento hasComleteSnapshot]){
        
            [self setMark:[aMemento mark]];
    
        }else {
        // if the memento contains only
        // incremental mark, then we need to
        // create a parent Stroke object to
        // hold it

        
            parentMark_ = [[Stroke alloc] init];
        
            [self attachStateFromMemento:aMemento];
    }
    }
    return self;
    
}
- (void) attachStateFromMemento:(ScribbleMemento *)memento
{

    //attach anyobject from a mement object
    //to the main patrent
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}

- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot
{
    //
    id<Mark> mementoMark = incrementalMark_;
    //if the resulting memento asks
    //for a complete snapshot ,then
    // set it with parentMark
    if (hasCompleteSnapshot)
    {
        mementoMark = parentMark_;
    }
    else if(mementoMark==nil)
    {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc] initWithMark:mementoMark];
    [memento setHasComleteSnapshot:hasCompleteSnapshot];
    
    // 返回的是 ScribbleMemento备忘
    return memento;
}

- (ScribbleMemento *)scribbleMemento
{
    return [self scribbleMementoWithCompleteSnapshot:YES];
    
}
+(Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento
{
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}
@end
