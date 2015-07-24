//
//  CanvasView.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"
@implementation CanvasView

@synthesize mark = mark_;


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    [mark_ acceptMarkVisitor:markRenderer];
    
}
@end
