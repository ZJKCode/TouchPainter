//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject
{
    @private
    id<Mark> mark_;
    BOOL hasCompleteSnapshot_;
}

+(ScribbleMemento *)mementoWithData:(NSData *)data;
- (NSData *)data;
@end
