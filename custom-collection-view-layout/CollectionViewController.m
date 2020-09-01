//
//  CollectionViewController.m
//  custom-collection-view-layout
//
//  Created by Jacobo Tapia on 9/1/20.
//

#import "CollectionViewController.h"
#import "CollectionViewCustomLayout.h"
#import "FirstCollectionViewItem.h"

@interface CollectionViewController ()

@property (weak, nonatomic) IBOutlet NSCollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)awakeFromNib
{
    [self _configureCollectionView];
}

- (void)_configureCollectionView
{
    CollectionViewCustomLayout *layout = [[CollectionViewCustomLayout alloc] init];
    _collectionView.collectionViewLayout = layout;
    _collectionView.backgroundColors = @[ NSColor.purpleColor ];
    [_collectionView registerClass:FirstCollectionViewItem.class forItemWithIdentifier:@"FirstCollectionViewItem"];
}

// MARK: CollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    return [_collectionView makeItemWithIdentifier:@"FirstCollectionViewItem" forIndexPath:indexPath];
}

@end
