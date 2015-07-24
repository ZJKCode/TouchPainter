//
//  MarkEnumerator.h
//  TouchPainter
//  迭代器
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"
@interface MarkEnumerator : NSEnumerator
{
@private
    NSMutableArray *stack_;
}
- (NSArray *)allObjects;
- (id)nextObject;

@end
