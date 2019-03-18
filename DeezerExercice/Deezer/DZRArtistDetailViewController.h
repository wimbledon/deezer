//
//  DZArtistDetailViewController.h
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZRArtist.h"

@interface DZRArtistDetailViewController : UITableViewController

- (instancetype)initWithArtist:(DZRArtist *)artist NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

