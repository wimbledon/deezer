//
//  DZRArtistCollectionViewCell.h
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZRArtist.h"

@interface DZRArtistCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (nonatomic, strong) DZRArtist *data;

@end
