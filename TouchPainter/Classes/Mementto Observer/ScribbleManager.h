//
//  ScribbleManager.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"
#import "ScribbleThumbnailViewImageProxy.h"

@interface ScribbleManager : NSObject
{
}

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger) numerOfScribbles;
- (Scribble *) scribbleAtIndex:(NSInteger)index;
- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index;

@end
