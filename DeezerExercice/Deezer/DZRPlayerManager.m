//
//  DZPlayerManager.m
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRPlayerManager.h"
@import AVKit;

@interface DZRPlayerManager()
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation DZRPlayerManager

+ (DZRPlayerManager *)sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (void)playUrl:(NSString *)url
{
    [self stop];
    
    NSString *urlString = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *itemUrl = [NSURL URLWithString:urlString];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:itemUrl];
    self.player = [[AVPlayer alloc] initWithPlayerItem:item];
    self.player.automaticallyWaitsToMinimizeStalling = NO;
    [self.player play];
}

- (void)stop
{
    [self.player pause];
    self.player = nil;
}


@end
