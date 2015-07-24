//
//  CanvasView.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"
#import "Vertex.h"
@protocol Mark;

@interface CanvasView : UIView
{
    //@private
    id<Mark> mark_;
}
@property (nonatomic,strong)id<Mark> mark;

@property (nonatomic,strong)Vertex *vertex;

@end
