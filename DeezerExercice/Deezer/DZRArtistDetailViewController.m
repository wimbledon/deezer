//
//  DZArtistDetailViewController.m
//  Deezer
//
//  Created by David Liu on 2/20/19.
//  Copyright © 2019 Deezer. All rights reserved.
//

#import "DZRArtistDetailViewController.h"
#import "DZRHttpManager.h"
#import "DZRTrackTableViewCell.h"
#import "DZRPlayerManager.h"

static NSString *const kTrackCellIdentifier = @"trackCell";

@interface DZRArtistDetailViewController ()
@property (nonatomic, strong) DZRArtist *artist;
@property (nonatomic, strong) NSArray *tracks;
@end

@implementation DZRArtistDetailViewController

- (instancetype)initWithArtist:(DZRArtist *)artist
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _artist = artist;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:DZRTrackTableViewCell.class forCellReuseIdentifier:kTrackCellIdentifier];
    
    self.title = self.artist.name;
    
    self.tableView.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView.refreshControl addTarget:self action:@selector(_refresh) forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView.refreshControl layoutIfNeeded];
    [self.tableView.refreshControl beginRefreshing];
    [self _refresh];
}

- (void)_refresh
{
    __weak typeof(self) weakSelf = self;
    [[DZRHttpManager sharedInstance] fetchArtistTracklist:self.artist
                                       completionHandler:^(NSArray<DZRArtist *> * _Nullable tracks, NSError * _Nullable error) {
                                           [weakSelf.tableView.refreshControl endRefreshing];
                                           weakSelf.tracks = tracks;
                                           [weakSelf.tableView reloadData];
                                       }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DZRTrackTableViewCell *cell = (DZRTrackTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTrackCellIdentifier forIndexPath:indexPath];
    cell.data = self.tracks[indexPath.row];
    return cell;
}

#pragma mark - Table view delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZRTrack *selectedTrack = self.tracks[indexPath.row];
    [[DZRPlayerManager sharedInstance] playUrl:selectedTrack.previewUrl];
}

@end
