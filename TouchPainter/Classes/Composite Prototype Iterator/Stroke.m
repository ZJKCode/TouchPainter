//
//  Stroke.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Internal.h"

@implementation Stroke
@synthesize color = color_,size = size_;
@dynamic loction;

- (id)init
{
    if (self = [super init]) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
        
    }
    return self;
}

- (void)setLoction:(CGPoint)loction
{

}

- (CGPoint)loction
{
    if ([children_ count]>0) {
        return [[children_ objectAtIndex:0] loction];
    }
    return CGPointZero;
}

- (void) addMark:(id<Mark>)mark
{
    [children_ addObject:mark];
}

- (void) removeMark:(id<Mark>)mark
{
    if ([children_ containsObject:mark]) {
      
        [children_ removeObject:mark];

    }else{
    [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];

    }
}

- (id<Mark>) childMarkAtIndex:(NSUInteger)index
{
    if (index >= [children_ count]) {
        return nil;
    }
    return [children_ objectAtIndex:index];
    
}

- (id<Mark>) lastChild
{
    return [children_ lastObject];
}

- (NSUInteger) count
{
    return [children_ count];
}

- (void) acceptMarkVisitor:(id<MarkVisitor>)visitor
{

    for (id<Mark> dot in children_) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
    
}
#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Stroke *strokeCopy = [[self class] allocWithZone:zone];
    [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    
    [strokeCopy setSize:size_];
    
    for (id<Mark>child in children_) {
        id<Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
    
}

#pragma mark -
#pragma mark NSCoder method

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        color_= [aDecoder decodeObjectForKey:@"StrokeColor"];
        size_ = [aDecoder decodeFloatForKey:@"StrokeSize"];
        children_ = [aDecoder decodeObjectForKey:@"StrokeChildren"];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:color_ forKey:@"StrokeColor"];
    [aCoder encodeFloat:size_ forKey:@"StrokeSize"];
    [aCoder encodeObject:children_ forKey:@"StrokeChildren"];
    
}

#pragma mark 
#pragma mark enumerator methods

- (NSEnumerator *) enumerator
{
    return [[MarkEnumerator alloc] initWithMark:self];
}
- (void) ennumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block
{
    BOOL stop = NO;
    NSEnumerator *enumerator = [self enumerator];
    for (id<Mark>mark in enumerator) {
        block(mark,&stop);
        if ((stop)) {
            break;
        }
    }
}

#pragma mark  -
#pragma mark An Extened Direct-draw Example

- (void)drawWithContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, self.loction.x, self.loction.y);
    for (id<Mark>mark in children_) {
        [mark drawWithContext:context];
    }
    CGContextSetLineWidth(context, self.size);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextStrokePath(context);
    
}
@end
