//
//  PaletteViewController.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "PaletteViewController.h"

@interface PaletteViewController ()

@end

@implementation PaletteViewController
- (void)viewDidDisappear:(BOOL)animated
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:[redSlider_ value] forKey:@"red"];
    [userDefaults setFloat:[greenSlider_ value] forKey:@"green"];
    [userDefaults setFloat:[blueSlider_ value] forKey:@"blue"];
    [userDefaults setFloat:[sizeSlider_ value] forKey:@"size"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[redSlider_ command];
   // colorCommand.delegate = self;//使用代理模式实现
    
    SetStrokeSizeCommand *sizeCommand = (SetStrokeSizeCommand *)[sizeSlider_ command];
    sizeCommand.delegate = self;
    
    //使用块语言实现
    [colorCommand setRGBValuesProvider:^(CGFloat *red,CGFloat *green,CGFloat *blue){
        *red = [redSlider_ value];
        *green = [greenSlider_ value];
        *blue = [blueSlider_ value];
    }];
    
    //set post-update provider to the command
    //for any callback after a new color is set
    [colorCommand setPostColorUpdateProvider:^(UIColor *color){
        [paletteView_ setBackgroundColor:color];
    }];
    
    // restore the original values of the sliders
    // and the color of the small palette view
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    
    [redSlider_ setValue:redValue];
    [greenSlider_ setValue:greenValue];
    [blueSlider_ setValue:blueValue];
    [sizeSlider_ setValue:sizeValue];
    

    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [paletteView_ setBackgroundColor:color];

}

#pragma mark -
#pragma mark SetStrokeColorCommandDelegate
- (void) command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue
{
    *red = [redSlider_ value];
    *green = [greenSlider_ value];
    *blue = [blueSlider_ value];
    
}
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateColor:(UIColor *)color
{
    [paletteView_ setBackgroundColor:color];
    
}
#pragma mark
#pragma mark - SetStrokeSizeCommand

- (void)command:(SetStrokeSizeCommand *)command didRequestForStrokeSize:(CGFloat *)size
{
    *size = [sizeSlider_ value];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)commandSliderValueChanged:(CommandSlider *)sender {
    [[sender command] execute];
    
}
@end
