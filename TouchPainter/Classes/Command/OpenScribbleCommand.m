//
//  OpenScribbleCommand.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation OpenScribbleCommand
@synthesize scribbleSource = scribbleSource_;

- (id) initWithScribbleSource:(id<ScribbleSource>) aScribbleSource
{
    if (self = [super init]) {
        [self setScribbleSource:aScribbleSource];
    }
    return self;
    
}
- (void) execute
{
    // get a scribble from the scribbleSource_

    Scribble *scribble = [scribbleSource_ scribble];
    
    //set it to current CanvasViewController
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    [controller setScribble:scribble];
    [coordinator requsetViewChangeByObject:self];
    

}

@end
