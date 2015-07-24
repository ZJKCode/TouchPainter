//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"
@interface ScribbleMemento ()
- (id) initWithMark:(id<Mark>)aMark;

@property (nonatomic, copy)id<Mark>mark;
@property (nonatomic, assign) BOOL hasComleteSnapshot;


@end
