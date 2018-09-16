//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"

typedef enum
{
    kButtonDone,
    kButtonTagOpenPeletteView,
    kButtonTagOpenThumbnailView
} ButtonTag;
@interface CoordinatingController : NSObject
{
    @protected
    CanvasViewController *canvasViewController_;
    UIViewController *activeViewController_;
}

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController*) sharedInstance;

- (IBAction)requsetViewChangeByObject:(id)object;


@end
