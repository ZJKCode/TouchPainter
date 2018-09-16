//
//  ScribbleSource.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

@protocol ScribbleSource <NSObject>

- (Scribble *)scribble;

@end
