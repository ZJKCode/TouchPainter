//
//  Mark.h
//  TouchPainter
//  定义协议，作为父类
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//  协议不能定义属性 @property 是声明get和set两个方法


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

@protocol Mark <NSObject,NSCopying,NSCoding>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint loction;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id<Mark>lastChild;

- (id)copy;
- (void)addMark:(id<Mark>) mark;
- (void) removeMark:(id<Mark>) mark;
- (id<Mark>) childMarkAtIndex:(NSUInteger) index;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id<MarkVisitor>) visitor;

// for the Iterator pattern
- (NSEnumerator *)enumerator;

// for internal iterator implementation
- (void) ennumerateMarksUsingBlock:(void(^)(id<Mark>item,BOOL *stop))block;

// for a bad example
- (void) drawWithContext:(CGContextRef) context;


@end
