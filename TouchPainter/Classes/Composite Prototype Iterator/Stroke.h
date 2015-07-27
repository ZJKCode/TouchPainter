//
//  Stroke.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "MarkEnumerator.h"

@protocol MarkVisitor;

@interface Stroke : NSObject<Mark>
{
    @private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray *children_;
    
}

@property (nonatomic, retain)UIColor *color;
@property (nonatomic, assign)CGFloat size;
@property (nonatomic, assign)CGPoint loction;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark>lastChild;

- (void) addMark:(id<Mark>)mark;
- (void) removeMark:(id<Mark>)mark;
- (id<Mark>) childMarkAtIndex:(NSUInteger) index;
- (void) acceptMarkVisitor:(id<MarkVisitor>)visitor;
- (id)copyWithZone:(NSZone *)zone;
- (NSEnumerator *) enumerator;
- (void) ennumerateMarksUsingBlock:(void(^)(id<Mark> item,BOOL *stop)) block;
- (id)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

@end
