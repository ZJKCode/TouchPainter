//
//  UIView+UIImage.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "UIView+UIImage.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (UIImage)

- (UIImage *)image
{

   /*Create a graphics context with the target size on iOS4 and later 
    use UIGraphicsBeginIamgeContextWithOptions to make 
    the scale into consideration
    On iOS prior to 4 ,fall back to use UIGraphicsBeginIamgeContext;
    
    */
    CGSize imageSize = [self bounds].size;
    if (NULL != &UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
     else
        UIGraphicsBeginImageContext(imageSize);
    
    //获取当前UIView的当前视图的上下文
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Iterate over every window form back to front
    
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)||[window screen]==[UIScreen mainScreen] ]) {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point

            CGContextTranslateCTM(context,
                                  -[window bounds].size.width *[[window layer] anchorPoint].x,
                                  -[window bounds].size.height*[[window layer] anchorPoint].y);
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            // Restore the context
            CGContextRestoreGState(context);
            
        }
    }
    // Retrieve the screenshot image

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}
@end
