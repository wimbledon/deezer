//
//  DZRTrackTableViewCell.h
//  Deezer
//
//  Created by David Liu on 2/21/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZRTrack.h"

@interface DZRTrackTableViewCell : UITableViewCell

@property (nonatomic, strong) DZRTrack *data;

- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

