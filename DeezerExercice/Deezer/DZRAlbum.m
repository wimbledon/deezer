//
//  DZAlbum.m
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRAlbum.h"

@implementation DZRAlbum

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        __id = dictionary[@"id"];
        _title = dictionary[@"title"];
        _coverUrl = dictionary[@"cover"];
        _tracklistUrl = dictionary[@"tracklist"];
    }
    return self;
}


@end
