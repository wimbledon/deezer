//
//  DZPlayerManager.h
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DZRPlayerManager : NSObject

+ (DZRPlayerManager *)sharedInstance;

- (void)playUrl:(NSString *)url;
- (void)stop;

@end
