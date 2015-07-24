//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Commond.h"
#import "ScribbleSource.h"

@interface OpenScribbleCommand : Commond
{
    @private
    id <ScribbleSource>scribbleSource_;
    
}

@property (nonatomic, retain) id<ScribbleSource>scribbleSource;

- (id) initWithScribbleSource:(id<ScribbleSource>) aScribbleSource;
- (void) execute;

@end
