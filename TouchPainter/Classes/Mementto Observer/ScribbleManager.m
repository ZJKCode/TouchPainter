//
//  ScribbleManager.m
//  TouchPainter
//
//  Created by zhangjikuan on 15/7/23.
//  Copyright (c) 2015年 zhang_jk. All rights reserved.
//

#import "ScribbleManager.h"
#import "OpenScribbleCommand.h"

#define kScribbleDataPath [ NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [ NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]
@interface ScribbleManager ()

- (NSString *) scribbleDataPath;
- (NSString *) scribbleThumbnailPath;//缩略图
- (NSArray *) scribbleDataPaths;
- (NSArray *) scribbleThumbnailPaths;


@end

@implementation ScribbleManager

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image
{
    //get a new index for the new scribble data and its thumbnail
    NSInteger newIndex = [self numerOfScribbles] +1;
    
    // use the index as part of the name of each of them
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld",(long)newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%ld",(long)newIndex];
    
      //get a memento from the scribble
    //then save the memento into the file system
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    
    NSString *mementtoPath = [[self scribbleDataPath] stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementtoPath atomically:YES];
    
    //save the thumbnail directly in
    // the file system
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath] stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];

}

- (NSInteger) numerOfScribbles
{

    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    return scribbleDataPathsArray.count;
}

- (Scribble *) scribbleAtIndex:(NSInteger)index;
{
    Scribble *loadedScribble = nil;
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    
    // load scribble data from the path indicated
    //by index
    NSString *scribblePath = [scribbleDataPathsArray objectAtIndex:index];
    if (scribblePath) {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    return loadedScribble;
    
}

- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index
{
    ScribbleThumbnailViewImageProxy *loadedScribbleThumbnai = nil;
    NSArray *scribbleThumbnailPathsArray = [self scribbleThumbnailPaths];
    NSArray *scribblePathsArray = [self scribbleDataPaths];
    
    //load scribble thumbnail from the path indicated;
    //by the index
    NSString *scribbleThumbnailPath = [scribbleThumbnailPathsArray objectAtIndex:index];
    NSString *scribblePath = [scribblePathsArray objectAtIndex:index];
    if (scribbleThumbnailPath) {
        loadedScribbleThumbnai = [[ScribbleThumbnailViewImageProxy alloc] init];
        [loadedScribbleThumbnai setImagePath:[kScribbleThumbnailPath stringByAppendingPathComponent:scribbleThumbnailPath]];
        
        [loadedScribbleThumbnai setScribblePath:[kScribbleDataPath stringByAppendingPathComponent:scribblePath]];
        
        //assign a touch command to the scribble thumbnail
        //so it can be used to open a scrbble by touch
        
        OpenScribbleCommand *touchCommand = [[OpenScribbleCommand alloc] initWithScribbleSource:loadedScribbleThumbnai];
        [loadedScribbleThumbnai setTouchCommand:touchCommand];
    }
    
    return loadedScribbleThumbnai;
}


#pragma mark -
#pragma mark - Private Methods
- (NSString *) scribbleDataPath
{
    //lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath]) {
        NSFileManager *fileManager =[NSFileManager defaultManager];
        //创建文件夹
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    return kScribbleDataPath;
}

- (NSString *) scribbleThumbnailPath
{

    //lazy create the scribble thumbnail directory
    //lazy create the scribble data directory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath]) {
        NSFileManager *fileManager =[NSFileManager defaultManager];
        //创建文件夹
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    return kScribbleThumbnailPath;

}

- (NSArray *) scribbleDataPaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error ;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath] error:&error];
    
    return scribbleDataPathsArray;
}

- (NSArray *) scribbleThumbnailPaths
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error ;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath] error:&error];
    
    return scribbleThumbnailPathsArray;
}



@end
