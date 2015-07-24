//
//  SaveScribbleCommand.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"
#import "CoordinatingController.h"
#import "UIView+UIImage.h"

@implementation SaveScribbleCommand
- (void)execute
{
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
    UIImage *canvasImage = [[canvasViewController canvasView] image];
    Scribble *scribble = [canvasViewController scribble];
    
    //use an instance of ScribbleManager
    //to save the scribble an its thumbnail
    ScribbleManager *scribbleManager = [[ScribbleManager alloc] init];
    [scribbleManager saveScribble:scribble thumbnail:canvasImage];
    
    // finaly show an alertbox that says
    // after the scibble is saved
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Your scribble is saved"
                              message:nil
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil];
    [alertView show];
}
@end
