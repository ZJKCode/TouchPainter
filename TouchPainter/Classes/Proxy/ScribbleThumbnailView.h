//
//  ScribbleThumbnailView.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScribbleSource.h"
#import "Scribble.h"

@interface ScribbleThumbnailView : UIView<ScribbleSource>
{
    @protected
    NSString *imagePath_;
    NSString *scribblePath_;
}

@property (nonatomic,readonly) UIImage *image;
@property (nonatomic,readonly) Scribble *scribble;
@property (nonatomic,copy) NSString *imagePath;
@property (nonatomic,copy) NSString *scribblePath;


@end
