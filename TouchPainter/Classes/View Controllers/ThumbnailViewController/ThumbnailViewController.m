//
//  ThumbnailViewController.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/21.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "ThumbnailViewController.h"

@interface ThumbnailViewController ()

@end

@implementation ThumbnailViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    //set the table view's backgroudColor
    //with dark cloth texture image
    UIColor *bakgroudColor = [UIColor colorWithPatternImage:                              [UIImage imageNamed:@"background_texture.png"]];
    self.view.backgroundColor = bakgroudColor;
    
    //initilaze the scribbles manager
    scrbbleManager_ = [[ScribbleManager alloc] init];
    NSInteger numberOfScribbles = [scrbbleManager_ numerOfScribbles];
    [navItem_ setTitle:[NSString stringWithFormat:
                        numberOfScribbles > 1 ? @"%ld items" : @"%ld item",
                        (long)numberOfScribbles]];

}

#pragma mark -
#pragma mark Table View dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    //Return the number of rows in the section
    CGFloat numberOfPlaceHoders = [ScribbleThumbnailCell numberOfPlaceHoders];
    NSInteger numerOfScribbles = [scrbbleManager_ numerOfScribbles];
    //返回大于或者等于指定表达式的最小整数
    NSInteger numerOfRows = ceil(numerOfScribbles/numberOfPlaceHoders);
    return numerOfRows;
    
}
// Customize the appearance of table view cells.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifie = @"Cell";
    ScribbleThumbnailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifie];
    if (cell == nil) {
        cell = [[ScribbleThumbnailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifie];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }
    // Configure the cell...
    
    // populate  thumbnails in each cell
    
    // get max number of thumbnail a thumbnail
    // cell can support

    NSInteger numberOfSupportedThumbnails = [ScribbleThumbnailCell numberOfPlaceHoders];
    
    // we can only add max numberOfSupportedThumbnails
    // at a time in each cell
    // e.g. numberOfSupportedThumbnails = 3
    // thumbnail index in the scribble manager is (row index *3) +0, +1, +2
    NSUInteger rowIndex = indexPath.row;
    NSInteger thumbnailIndex = rowIndex *numberOfSupportedThumbnails;
    NSInteger numberOfScribbles = [scrbbleManager_ numerOfScribbles];
    for (NSInteger i = 0; i<numberOfSupportedThumbnails&&
         (thumbnailIndex +i)<numberOfScribbles; i++) {
        
        UIView *scribbleThumbnai = [scrbbleManager_ scribbleThumbnailViewAtIndex:thumbnailIndex+i];
        [cell addThumbnailView:scribbleThumbnai atIndex:i];
    }
    return cell;

}

#pragma mark -
#pragma mark TableView delegate 

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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

@end
