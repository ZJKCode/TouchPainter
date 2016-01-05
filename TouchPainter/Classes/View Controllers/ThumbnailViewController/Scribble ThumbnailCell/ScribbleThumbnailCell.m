//
//  ScribbleThumbnailCell.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/24.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "ScribbleThumbnailCell.h"

@implementation ScribbleThumbnailCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //Initilization code
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

+ (NSInteger) numberOfPlaceHoders;
{
    return 3;
}
- (void) addThumbnailView:(UIView *)thumbnailView
                  atIndex:(NSInteger)index
{
    if (index==0) {
        for (UIView *view in [[self contentView] subviews]) {
            [view removeFromSuperview];
        }
    }
    
    if (index< [ScribbleThumbnailCell numberOfPlaceHoders]) {
        CGFloat x = index *100 + (index+1)*5;
        CGFloat y = 10;
        CGFloat width = 100;
        CGFloat height = 140;
        [thumbnailView setFrame:CGRectMake(x,y , width, height)];
        [self.contentView addSubview:thumbnailView];
        
    }
}


@end
