//
//  SetStrokeColorCommand.h
//  TouchPainter
//  代理模式和块的模式都可以实现系统的控制
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Commond.h"

//块的设计模式 ： 返回类型 (^定义类型) (类型标签)
typedef void (^RGBValuesProvider)(CGFloat *red, CGFloat *green,CGFloat *blue);
typedef void (^PostColorUpdateProvider)(UIColor *color);

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate <NSObject>

- (void) command:(SetStrokeColorCommand *)command
didRequestColorComponentsForRed:(CGFloat *)red
           green:(CGFloat *)green
            blue:(CGFloat *)blue;

- (void) command:(SetStrokeColorCommand *)command didFinishColorUpdateColor:(UIColor *)color;


@end

@interface SetStrokeColorCommand : Commond
{
    @private
    id <SetStrokeColorCommandDelegate>__weak delegate_;
    RGBValuesProvider RGBValuesProvider_;
    PostColorUpdateProvider postColorUpdateProvider_;
}

@property (nonatomic,weak) id<SetStrokeColorCommandDelegate>delegate;
@property (nonatomic, copy) RGBValuesProvider RGBValuesProvider;
@property (nonatomic, copy) PostColorUpdateProvider postColorUpdateProvider;

- (void)execute;

@end
