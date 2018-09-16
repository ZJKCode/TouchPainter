//
//  CommandSlider.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commond.h"
@interface CommandSlider : UISlider
{
    @protected
    Commond *command_;

}
@property (retain, nonatomic) IBOutlet Commond *command;

@end
