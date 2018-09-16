//
//  ScribbleThumbnailCell.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScribbleThumbnailView.h"

@interface ScribbleThumbnailCell : UITableViewCell

+ (NSInteger) numberOfPlaceHoders;
- (void) addThumbnailView:(UIView *)scribbleThumbnailView
                  atIndex:(NSInteger)index;

@end
