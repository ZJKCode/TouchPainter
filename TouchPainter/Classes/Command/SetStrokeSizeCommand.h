//
//  SetStrokeSizeCommand.h
//  TouchPainter
//  代理模式
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Commond.h"

@class SetStrokeSizeCommand;


@protocol SetStrokeSizeCommandDelegate <NSObject>;

- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat*)size;

@end

@interface SetStrokeSizeCommand : Commond
{
    @private
    id<SetStrokeSizeCommandDelegate>__weak delegate_;
}

@property (nonatomic,weak)id<SetStrokeSizeCommandDelegate>delegate;

- (void) execute;

@end

