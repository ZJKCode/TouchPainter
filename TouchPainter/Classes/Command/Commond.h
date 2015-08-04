//
//  Commond.h
//  TouchPainter
//  命令模式
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commond : NSObject
{
@protected
    NSDictionary *userInfo_;
}
@property (nonatomic, retain)NSDictionary *userInfo;

- (void) execute;
- (void) undo;


@end
