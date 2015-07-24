//
//  Dot.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Vertex.h"

@protocol MarkVisitor;

@interface Dot : Vertex
{

    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;

- (void) acceptMarkVisitor:(id<MarkVisitor>) visitor;
- (id)copyWithZone:(NSZone *)zone;
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;


@end
