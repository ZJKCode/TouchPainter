//
//  CanvasViewController.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scribble.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "CommondBarButton.h"
#import "NSMutableArray+Stack.h"

@interface CanvasViewController : UIViewController
{
    @private
    Scribble *scribble_;
    CanvasView *canvasView_;
    
    CGPoint startPont_;
    UIColor *strokeColor_;
    CGFloat  strokeSize_;
}

@property (nonatomic,retain) Scribble *scribble;
@property (nonatomic,retain) CanvasView *canvasView;
@property (nonatomic,retain) UIColor *strokeColor;
@property (nonatomic,assign) CGFloat strokeSize;


- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

- (IBAction)onBarButtonHit:(id)sender;


- (IBAction)onCustomBarButtonHit:(CommondBarButton *)sender;

- (NSInvocation *) drawScribbleInvocation;
- (NSInvocation *) undrawScribbleInvocation;

- (void) executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation;
- (void) unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation;

@end
