//
//  DZTrack.h
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZRArtist.h"
#import "DZRAlbum.h"

@interface DZRTrack : NSObject
@property (nonatomic) NSString *_id;
@property (nonatomic) NSString *previewUrl;
@property (nonatomic) NSString *title;
@property (nonatomic, strong) DZRArtist *artist;
@property (nonatomic, strong) DZRAlbum *album;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

