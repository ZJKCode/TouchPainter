//
//  PaletteViewController.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandSlider.h"
#import "CommondBarButton.h"
#import "SetStrokeColorCommand.h"
#import "SetStrokeSizeCommand.h"

@interface PaletteViewController : UIViewController<SetStrokeColorCommandDelegate,SetStrokeSizeCommandDelegate>
{
    @private
    IBOutlet CommandSlider *redSlider_;
    IBOutlet CommandSlider *greenSlider_;
    
    IBOutlet CommandSlider *blueSlider_;
    
    IBOutlet CommandSlider *sizeSlider_;
    IBOutlet UIView *paletteView_;
}

- (IBAction)commandSliderValueChanged:(CommandSlider *)sender;

@end
