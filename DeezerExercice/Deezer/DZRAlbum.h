//
//  DZAlbum.h
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZRAlbum : NSObject
@property (nonatomic) NSString *coverUrl;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *tracklistUrl;
@property (nonatomic) NSString *_id;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
