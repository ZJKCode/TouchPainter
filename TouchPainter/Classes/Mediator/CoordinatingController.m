//
//  CoordinatingController.m
//  TouchPainter
//  中介者模式
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//  中介者

#import "CoordinatingController.h"

@interface CoordinatingController ()

- (void) initalize;

@end


@implementation CoordinatingController

@synthesize activeViewController = activeViewController_;
@synthesize canvasViewController = canvasViewController_;

static CoordinatingController *shareCoordinator = nil;

- (void) initalize
{
    canvasViewController_ = [[CanvasViewController alloc] init];
    activeViewController_ = canvasViewController_;
}
#pragma mark
#pragma mark CoordinatingController Singleton Implementation
+ (CoordinatingController*) sharedInstance
{
    if (shareCoordinator==nil) {
        shareCoordinator = [[super allocWithZone:NULL] init];
        
        //initalize the first view controller
        //and keep it with singleton
        [shareCoordinator initalize];
    }
    return shareCoordinator;
}

+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
    
    //return [[self sharedInstance] retain];
}

- (id) copyWithZone:(NSZone *)zone
{
    return self;
}

- (IBAction)requsetViewChangeByObject:(id)object
{
    if ([object isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)object tag]) {
            case kButtonTagOpenPeletteView:
            {
                // load a PaletteViewControlle
                PaletteViewController *controller = [[PaletteViewController alloc] init];
             
                // transition to the PaletteViewController
                // set the activeViewController to
                // paletteViewController
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
                activeViewController_ = controller;
                
                
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                // load a ThumbnailViewController
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
                
                //transiton to the ThumbnailViewController
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
               
                //set the activeViewController_ to
                //canvasViewController_
                activeViewController_ = controller;
                
            }
                break;
            default:
                // just go back to the main canvasViewController
                // for the other types
            {
                // The Done command is shared on every
                // view controller except the CanvasViewController
                // When the Done button is hit, it should
                // take the user back to the first page in
                // conjunction with the design
                // other objects will follow the same path
                [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
                // set the activeViewController back to
                // canvasViewController
                activeViewController_ = canvasViewController_;
                
            }
                break;
        }
    }
    else
    {
        [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
        activeViewController_ = canvasViewController_;
        
    }
}
@end
