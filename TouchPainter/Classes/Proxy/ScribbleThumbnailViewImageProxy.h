//
//  ScribbleThumbnailViewImageProxy.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScribbleThumbnailView.h"
#import "Commond.h"

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
    @private
    Scribble *scribble_;
    Commond *touchCommand_;
    UIImage *realImage_;
    BOOL loadingThreadHasLaunched_;
    
}

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) Scribble *scribble;
@property (nonatomic, retain) Commond *touchCommand;
@end
