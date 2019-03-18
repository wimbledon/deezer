//
//  DZHttpManager.h
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZRArtist.h"

@interface DZRHttpManager : NSObject

+ (DZRHttpManager *)sharedInstance;

- (void)searchArtistsWithName:(NSString *)name
            completionHandler:(void (^)(NSArray<DZRArtist *> * _Nullable artists, NSError * _Nullable error))completionHandler;

- (void)fetchArtistTracklist:(DZRArtist *)artist
           completionHandler:(void (^)(NSArray<DZRArtist *> * _Nullable tracks, NSError * _Nullable error))completionHandler;

@end

