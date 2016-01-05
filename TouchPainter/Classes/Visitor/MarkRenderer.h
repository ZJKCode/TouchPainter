//
//  MarkRenderer.h
//  TouchPainter
//  访问者模式
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//  访问者模式

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"

@interface MarkRenderer : NSObject<MarkVisitor>
{
    @private
    BOOL shouldMoveContextToDot_;
    
    @protected
    CGContextRef context_;
    
}

- (id) initWithCGContext:(CGContextRef)context;

- (void) visitMark:(id<Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
//- (void) visitStroke:(Stroke *)stroke;

@end
