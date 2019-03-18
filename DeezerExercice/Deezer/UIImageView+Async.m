//
//  UIImageView+Async.m
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "UIImageView+Async.h"

@implementation UIImageView (Async)

- (void)loadUrl:(NSString *)url
{
    self.image = [UIImage imageNamed:@"loadingIndicator"];
    NSUInteger urlTag = [url hash];
    self.tag = urlTag;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *imageUrl = [NSURL URLWithString:url];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (weakSelf.tag == urlTag) {
                weakSelf.image = [UIImage imageWithData:imageData];
            }
            else {
                weakSelf.image = nil;
            }
            weakSelf.alpha = 0.0;
            [UIView animateWithDuration:0.4
                             animations:^{
                                 weakSelf.alpha = 1.0;
                             }];
        });
    });
}

@end
