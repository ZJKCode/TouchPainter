//
//  SetStrokeColorCommand.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CanvasViewController.h"
#import "CoordinatingController.h"
@implementation SetStrokeColorCommand
@synthesize RGBValuesProvider = RGBValuesProvider_;
@synthesize postColorUpdateProvider = postColorUpdateProvider_;
@synthesize delegate = delegate_;

- (void)execute
{
    CGFloat redVelue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
        [delegate_ command:self didRequestColorComponentsForRed:&redVelue
                 green:&greenValue
                  blue:&blueValue];
    
    //Block approach block实现方法
    
    if (RGBValuesProvider_ != nil) {
        RGBValuesProvider_ (&redVelue,&greenValue,&blueValue);
    }
    
    
    UIColor *color = [UIColor colorWithRed:redVelue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [delegate_ command:self didFinishColorUpdateColor:color];

    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    [controller setStrokeColor:color];
    
    //Delegate approach

    if (postColorUpdateProvider_!=nil) {
        postColorUpdateProvider_(color);
    }

}
@end
