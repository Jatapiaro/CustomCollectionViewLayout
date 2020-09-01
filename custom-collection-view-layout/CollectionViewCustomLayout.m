//
//  CollectionViewCustomLayout.m
//  custom-collection-view-layout
//
//  Created by Jacobo Tapia on 9/1/20.
//

#import "CollectionViewCustomLayout.h"

@implementation CollectionViewCustomLayout {
    CGFloat _itemHeight;
}

- (instancetype)init
{
    if (self = [super init]) {
        _itemHeight = 100;
    }

    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
}

/**
 * The width and height of the entire collection view content
 */
- (NSSize)collectionViewContentSize
{
    NSInteger numberOfItems = self.collectionView.numberOfSections;

    if (!numberOfItems)
        return NSZeroSize;

    NSSize size = self.collectionView.superview.bounds.size;
    size.height = _itemHeight * numberOfItems;

    return size;
}

/**
 * Set the layout of each item inside the collection view
 */
- (NSArray<__kindof NSCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(NSRect)rect
{
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray<NSCollectionViewLayoutAttributes *> *attributes = [NSMutableArray array];

    for (NSInteger i = 0; i < numberOfItems; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        NSCollectionViewLayoutAttributes *itemAttributes = [NSCollectionViewLayoutAttributes layoutAttributesForItemWithIndexPath:indexPath];

        if (itemAttributes)
            [attributes addObject:itemAttributes];
    }

    return attributes;
}

- (NSCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];

    if (!numberOfItems)
        return nil;

    NSRect frame = NSMakeRect(0, _itemHeight * indexPath.item, self.collectionViewContentSize.width, _itemHeight);

    NSCollectionViewLayoutAttributes *itemAttributes = [NSCollectionViewLayoutAttributes layoutAttributesForItemWithIndexPath:indexPath];
    itemAttributes.frame = frame;

    return itemAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(NSRect)newBounds
{
    return YES;
}

@end
