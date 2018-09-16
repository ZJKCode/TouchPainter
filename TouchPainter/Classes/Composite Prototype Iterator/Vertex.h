//
//  Vertex.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@protocol MarkVisitor;

@interface Vertex : NSObject <Mark>
{
    @protected
    CGPoint location_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint loction;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark>lastChild;

- (id)initWithLoction:(CGPoint) loction;
- (void)addMark:(id<Mark>) mark;
- (void) removeMark:(id<Mark>) mark;
- (id<Mark>) childMarkAtIndex:(NSUInteger) index;


// for the Visitor pattern
//- (void) acceptMarkVisitor:(id<MarkVisitor>) visitor;
- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;
// for the Prototype pattern
- (id) copyWithZone:(NSZone *)zone;

// for the Iterator pattern
- (NSEnumerator *)enumerator;

// for internal iterator implementation
- (void) ennumerateMarksUsingBlock:(void(^)(id<Mark>item,BOOL *stop))block;

// for the Memento pattern
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;


@end
