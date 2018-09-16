//
//  PrototypeController.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "PrototypeController.h"
#import "Mark.h"
#import "CanvasView.h"

@implementation PrototypeController

- (void)viewDidLoad
{

    [super viewDidLoad];
    //the following code snippets are for illustration purpose in the book only an not part of
    //app
    id <Mark> selectedMark;
    NSMutableArray *templateArray = [[NSMutableArray alloc] initWithCapacity:1];
    id <Mark> patternTemplate = [selectedMark copy];
    
    // save the patternTemplate in
    // a data structure so it can be
    // used later
    [templateArray addObject:patternTemplate];
    
    CanvasView *canvasView;
    id <Mark> currentMark;
    int patternIndex;
    
    id <Mark> patternClone = [templateArray objectAtIndex:patternIndex];
    [currentMark addMark:patternClone];
    [canvasView setMark:currentMark];
    [canvasView setNeedsDisplay];

    
}
@end
