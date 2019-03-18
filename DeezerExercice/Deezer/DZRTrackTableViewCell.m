//
//  DZRTrackTableViewCell.m
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRTrackTableViewCell.h"
#import "UIImageView+Async.h"

@implementation DZRTrackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.textLabel.text = nil;
    self.detailTextLabel.text = nil;
    self.imageView.image = nil;
}

- (void)setData:(DZRTrack *)data
{
    _data = data;
    self.textLabel.text = data.title;
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", data.artist.name, data.album.title];
    [self.imageView loadUrl:data.album.coverUrl];
}

@end
