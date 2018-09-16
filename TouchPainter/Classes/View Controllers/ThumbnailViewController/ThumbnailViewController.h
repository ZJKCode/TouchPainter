//
//  ThumbnailViewController.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScribbleThumbnailCell.h"
#import "ScribbleManager.h"
#import "CommondBarButton.h"

@interface ThumbnailViewController : UIViewController
<
UITabBarControllerDelegate,
UITableViewDataSource
>
{
    @private
    
   
    ScribbleManager *scrbbleManager_;
    IBOutlet UINavigationItem *navItem_;
    
}


@end
