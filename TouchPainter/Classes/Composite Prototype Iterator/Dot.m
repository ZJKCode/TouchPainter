//
//  Dot.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize size = size_,color = color_;
- (void) acceptMarkVisitor:(id<MarkVisitor>) visitor
{
    [visitor visitDot:self];
}
- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLoction:location_];
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [dotCopy setSize:size_];
    return dotCopy;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        color_ = [aDecoder decodeObjectForKey:@"DotColor"];
        size_ = [aDecoder decodeFloatForKey:@"DotSize"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:color_ forKey:@"DotColor"];
    [aCoder encodeFloat:size_ forKey:@"DotSize"];

}

#pragma mark -
#pragma mark An Extened Direct-draw Example;

//for a direct example
- (void) drawWithContext:(CGContextRef)context
{
    CGFloat x = self.loction.x;
    CGFloat y = self.loction.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x-frameSize/2.0, y-frameSize/2.0, frameSize, frameSize);
    CGContextSetFillColorWithColor(context, [self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}
@end
