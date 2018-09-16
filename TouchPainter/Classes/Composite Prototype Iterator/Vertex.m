//
//  Vertex.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "Vertex.h"


@implementation Vertex

@synthesize loction = location_;
@dynamic color,size;

- (id)initWithLoction:(CGPoint)loction
{
    if (self = [super init])
    {
        [self setLoction:loction];
    }
    return self;
}
- (void) setColor:(UIColor *)color{}
- (UIColor *)color{return nil;}
- (void)setSize:(CGFloat)size{}
- (CGFloat) size { return 0.0;}

- (void) addMark:(id<Mark>)mark{}
- (void) removeMark:(id<Mark>)mark{}
- (id<Mark>) childMarkAtIndex:(NSUInteger)index{return nil;}
- (id<Mark>) lastChild{ return nil;}
- (NSUInteger) count {return 0;}
- (NSEnumerator *)enumerator {return nil;}

- (void) acceptMarkVisitor:(id<MarkVisitor>) visitor
{

    [visitor visitVertex:self];
}

#pragma mark -
#pragma mark NSCopying method
// it needs to be implemented for memento

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy =[[[self class] allocWithZone:zone]initWithLoction:location_];
    
    return vertexCopy;
}

#pragma mark
#pragma mark NSCoder method
- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        location_ = [(NSValue *)[aDecoder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[NSValue valueWithCGPoint:location_] forKey:@"VertexLocation"];
}
#pragma mark -
#pragma mark MarkIterator methods

- (void) ennumerateMarksUsingBlock:(void (^)(id<Mark>, BOOL *))block{}
- (void)drawWithContext:(CGContextRef)context
{
    CGFloat x = self.loction.x;
    CGFloat y = self.loction.y;
    CGContextAddLineToPoint(context, x, y);
    
}

@end
