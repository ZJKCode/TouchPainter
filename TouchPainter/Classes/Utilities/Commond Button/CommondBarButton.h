//
//  CommondBarButton.h
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/22.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commond.h"

@interface CommondBarButton : UIBarButtonItem
{
    @protected
    Commond *commond_;
}

@property (nonatomic,retain)IBOutlet Commond *commond;


@end
