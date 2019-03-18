//
//  DZRArtistTest.m
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DZRArtist.h"

@interface DZRArtistTest : XCTestCase

@end

@implementation DZRArtistTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitsWithDictionary {
    /*
     {
     id = 1033;
     link = "https://www.deezer.com/artist/1033";
     name = "Alain Souchon";
     "nb_album" = 49;
     "nb_fan" = 60625;
     picture = "https://api.deezer.com/artist/1033/image";
     radio = 1;
     tracklist = "https://api.deezer.com/artist/1033/top?limit=50";
     type = artist;
     }
     */
    NSDictionary *dictionary = @{@"id":@"1033",
                                 @"link":@"https://www.deezer.com/artist/1033",
                                 @"name":@"Alain Souchon",
                                 @"nb_albums":@"49",
                                 @"nb_fan": @"60625",
                                 @"picture":@"https://api.deezer.com/artist/1033/image",
                                 @"radio":@"1",
                                 @"tracklist":@"https://api.deezer.com/artist/1033/top?limit=50",
                                 @"type":@"artist"};
    DZRArtist *artist = [[DZRArtist alloc] initWithDictionary:dictionary];
    
    XCTAssertEqualObjects(artist._id, @"1033");
    XCTAssertEqualObjects(artist.name, @"Alain Souchon");
    XCTAssertEqualObjects(artist.pictureUrl, @"https://api.deezer.com/artist/1033/image");
    XCTAssertEqualObjects(artist.tracklistUrl, @"https://api.deezer.com/artist/1033/top?limit=50");
}


@end
