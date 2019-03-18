//
//  DZRArtistCollectionViewCell.m
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import "DZRArtistCollectionViewCell.h"
#import "UIImageView+Async.h"

@implementation DZRArtistCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.artistImage.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.artistImage.image = nil;
    self.artistName.text = nil;
}

- (void)setData:(DZRArtist *)data
{
    _data = data;
    self.artistName.text = data.name;
    [self.artistImage loadUrl:data.pictureUrl];
}

@end
