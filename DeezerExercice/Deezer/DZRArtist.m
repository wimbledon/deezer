//
//  DZRArtist.m
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import "DZRArtist.h"

@implementation DZRArtist

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        __id = dictionary[@"id"];
        _name = dictionary[@"name"];
        _pictureUrl = dictionary[@"picture"];
        _tracklistUrl = dictionary[@"tracklist"];
    }
    return self;
}

@end
