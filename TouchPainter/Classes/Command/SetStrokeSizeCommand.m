//
//  SetStrokeSizeCommand.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"
@implementation SetStrokeSizeCommand
@synthesize delegate = delegate_;//设置同步必须设置不然会出现代理不能实现的错误

- (void) execute
{

    //get the current stroke size
    // from whatever it's myDelegate
    CGFloat strokeSize = 1;
    [delegate_ command:self didRequestForStrokeSize:&strokeSize];
    
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewContontroller = [coordinator canvasViewController];
    
    [canvasViewContontroller setStrokeSize:strokeSize];
    
}
@end
