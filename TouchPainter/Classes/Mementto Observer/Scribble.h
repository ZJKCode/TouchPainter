//
//  Scribble.h
//  TouchPainter
//  绘图
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "ScribbleMemento.h"

@interface Scribble : NSObject
{
    @private
    id<Mark> parentMark_;
    id<Mark> incrementalMark_;
}

//methods for Mark management
- (void) addMark:(id<Mark>) mark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void)removeMark:(id<Mark>) mark;

//methods for memento
- (id)initWithMemento:(ScribbleMemento *)aMemento;
+(Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento;
- (ScribbleMemento *)scribbleMemento;
- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void)attachStateFromMemento:(ScribbleMemento *)memento;

@end
