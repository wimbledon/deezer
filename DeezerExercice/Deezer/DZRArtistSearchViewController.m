//
//  DZRArtistSearchViewController.m
//  Deezer
//  Copyright (c) 2019 David Liu. All rights reserved.
//

#import "DZRArtistSearchViewController.h"
#import "DZRArtistCollectionViewCell.h"
#import "DZRUtility.h"
#import "DZRHttpManager.h"
#import "DZRArtistDetailViewController.h"

@interface DZRArtistSearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating, UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSURLSessionTask *searchTask;
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray *artists;

@end

@implementation DZRArtistSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"Artist Name";
    self.navigationItem.searchController = self.searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = NO;
    self.definesPresentationContext = YES;
    self.searchController.searchBar.delegate = self;
}

#pragma - Search

- (void)searchArtistsWithName:(NSString *)name {
    if (name.length) {
        __weak typeof(self) weakSelf = self;
        [[DZRHttpManager sharedInstance] searchArtistsWithName:name
                                            completionHandler:^(NSArray<DZRArtist *> * _Nullable artists, NSError * _Nullable error) {
                                                if (error) {
                                                    [DZRUtility showAlertWithTitle:@"Search Error!"
                                                                          message:error.localizedDescription
                                                                      actionTitle:nil
                                                                     dismissTitle:@"Okay"
                                                         presentingViewController:nil];
                                                }
                                                else {
                                                    weakSelf.artists = artists;
                                                    [weakSelf.collectionView reloadData];
                                                }
                                            }];
    }
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.searchController.active = NO;
}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self searchArtistsWithName:searchController.searchBar.text];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.artists.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArtistCollectionViewCellIdentifier";

    DZRArtistCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    DZRArtist *artist = [self.artists objectAtIndex:indexPath.row];
    cell.data = artist;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DZRArtist *selectedArtist = self.artists[indexPath.item];
    DZRArtistDetailViewController *advc = [[DZRArtistDetailViewController alloc] initWithArtist:selectedArtist];
    [self.navigationController pushViewController:advc animated:YES];
}

@end
