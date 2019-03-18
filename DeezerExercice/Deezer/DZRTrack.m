
//
//  DZTrack.m
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRTrack.h"

@implementation DZRTrack

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        __id = dictionary[@"id"];
        _previewUrl = dictionary[@"preview"];
        _title = dictionary[@"title"];
        _artist = [[DZRArtist alloc] initWithDictionary:dictionary[@"artist"]];
        _album = [[DZRAlbum alloc] initWithDictionary:dictionary[@"album"]];
    }
    return self;
}

@end
