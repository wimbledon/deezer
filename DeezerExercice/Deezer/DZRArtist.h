//
//  DZRArtist.h
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZRArtist : NSObject

@property (nonatomic) NSString *_id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *pictureUrl;
@property (nonatomic) NSString *tracklistUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
