//
//  DeleteScribbleCommand.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"
@implementation DeleteScribbleCommand


- (void)execute
{
    //从中介者（CoordinatingController）获得当前 CanvasViewController

    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinator canvasViewController];
    Scribble *newScribble = [[Scribble alloc] init];
    
    [canvasViewController setScribble:newScribble];
    
}
@end
