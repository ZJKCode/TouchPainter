//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MarkEnumerator()
- (id)initWithMark:(id<Mark>)aMark;
- (void) traverseAndBuildStackWithMark:(id<Mark>)mark;
@end
