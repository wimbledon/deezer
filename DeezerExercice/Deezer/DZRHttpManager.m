//
//  DZHttpManager.m
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRHttpManager.h"
#import "DZRArtist.h"
#import "DZRTrack.h"

@interface DZRHttpManager()
@property (nonatomic, strong) NSURLSessionTask *searchTask;
@end

@implementation DZRHttpManager

+ (DZRHttpManager *)sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (void)searchArtistsWithName:(NSString *)name completionHandler:(void (^)(NSArray<DZRArtist *> * _Nullable, NSError * _Nullable))completionHandler
{
    if (!self.searchTask || self.searchTask.state != NSURLSessionTaskStateRunning) {
        NSString *urlString = [NSString stringWithFormat:@"https://api.deezer.com/search/artist?q=%@", name];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *APIRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        self.searchTask = [[NSURLSession sharedSession] dataTaskWithRequest:APIRequest
                                                           completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                                   if (error) {
                                                                       completionHandler(nil, error);
                                                                   }
                                                                   else {
                                                                       NSError *err;
                                                                       NSDictionary *retData = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                               options:kNilOptions
                                                                                                                                 error:&err];
                                                                       if (err) {
                                                                           completionHandler(nil, err);
                                                                       }
                                                                       else {
                                                                           NSMutableArray *artists = [[NSMutableArray alloc] init];
                                                                           for (NSDictionary *d in [retData objectForKey:@"data"]) {
                                                                               DZRArtist *a = [[DZRArtist alloc] initWithDictionary:d];
                                                                               [artists addObject:a];
                                                                           }
                                                                           completionHandler([artists copy], nil);
                                                                       }
                                                                   }
                                                               });
                                                           }];
        [self.searchTask resume];
    }
}

- (void)fetchArtistTracklist:(DZRArtist *)artist completionHandler:(void (^)(NSArray<DZRArtist *> * _Nullable, NSError * _Nullable))completionHandler
{
    if (artist.tracklistUrl.length) {
        NSString *urlString = [artist.tracklistUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *APIRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        NSURLSessionTask *sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest:APIRequest
                                                          completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  if (error) {
                                                                      completionHandler(nil, error);
                                                                  }
                                                                  else {
                                                                      NSError *err;
                                                                      NSDictionary *retData = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                              options:kNilOptions
                                                                                                                                error:&err];
                                                                      if (err) {
                                                                          completionHandler(nil, err);
                                                                      }
                                                                      else {
                                                                          NSMutableArray *tracks = [[NSMutableArray alloc] init];
                                                                          for (NSDictionary *d in [retData objectForKey:@"data"]) {
                                                                              DZRTrack *t = [[DZRTrack alloc] initWithDictionary:d];
                                                                              [tracks addObject:t];
                                                                          }
                                                                          completionHandler([tracks copy], nil);
                                                                      }
                                                                  }
                                                              });
                                                          }];
        [sessionTask resume];
    }
}

@end
