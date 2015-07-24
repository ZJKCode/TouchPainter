//
//  MarkRenderer.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "MarkRenderer.h"
#import "MarkRenderer.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"
@implementation MarkRenderer
- (id) initWithCGContext:(CGContextRef)context
{
    if (self= [super init]) {
        context_ = context;
        shouldMoveContextToDot_ = YES;
    }
    return self;
    
}
- (void) visitMark:(id<Mark>)mark{

    //default behavior
    
}
- (void) visitDot:(Dot *)dot{
    CGFloat x = dot.loction.x;
    CGFloat y = dot.loction.y;
    CGFloat frameSize = dot.size;
    CGRect frame = CGRectMake(x - frameSize/2.0,
                               y - frameSize/2.0,
                               frameSize,
                               frameSize);
    
    CGContextSetFillColorWithColor(context_, [[dot color] CGColor]);
    CGContextFillEllipseInRect(context_, frame);
    

}
- (void) visitVertex:(Vertex *)vertex{
    CGFloat x = [vertex loction].x;
    CGFloat y = [vertex loction].y;
    if (shouldMoveContextToDot_) {
        CGContextMoveToPoint(context_, x, y);
        shouldMoveContextToDot_ = NO;
    }else {
        CGContextAddLineToPoint(context_, x, y);
        
    }
}
- (void) visitStroke:(Stroke *)stroke{
    CGContextSetStrokeColorWithColor(context_, [[stroke color] CGColor]);
    CGContextSetLineWidth(context_, [stroke size]);
    CGContextSetLineCap(context_, kCGLineCapRound);
    CGContextStrokePath(context_);
    shouldMoveContextToDot_ = YES;
    
}
@end
