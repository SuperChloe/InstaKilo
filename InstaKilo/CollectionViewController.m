//
//  CollectionViewController.m
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "Photo.h"
#import "Header.h"

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *imagesArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) NSMutableDictionary *categoryDictionary;
@property (strong, nonatomic) NSMutableDictionary *locationDictionary;
@property (strong, nonatomic) NSMutableDictionary *imagesDictionary;
@property (strong, nonatomic) NSMutableDictionary *allImagesDictionary;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.imagesArray = [[NSMutableArray alloc] init];
    self.categoryDictionary = [[NSMutableDictionary alloc] init];
    self.locationDictionary = [[NSMutableDictionary alloc] init];
    self.imagesDictionary = [[NSMutableDictionary alloc] init];
    self.allImagesDictionary = [[NSMutableDictionary alloc] init];
    
    Photo *photo1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1606.jpg"] category:@"On Back" andLocation:@"21 Widmer"];
    Photo *photo2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1643.jpg"] category:@"Sitting" andLocation:@"21 Widmer"];
    Photo *photo3 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1841.jpg"] category:@"Sitting" andLocation:@"399 Adelaide"];
    Photo *photo4 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1889.jpg"] category:@"On Back" andLocation:@"399 Adelaide"];
    Photo *photo5 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1892.jpg"] category:@"On Back" andLocation:@"399 Adelaide"];
    Photo *photo6 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1901.jpg"] category:@"Sitting" andLocation:@"399 Adelaide"];
    Photo *photo7 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1908.jpg"] category:@"Sitting" andLocation:@"399 Adelaide"];
    Photo *photo8 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1931.jpg"] category:@"Sitting" andLocation:@"399 Adelaide"];
    Photo *photo9 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1932.jpg"] category:@"On Back" andLocation:@"399 Adelaide"];
    Photo *photo10 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_2080.jpg"] category:@"On Back" andLocation:@"399 Adelaide"];
    
    [self.imagesArray addObjectsFromArray:@[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10]];
 
// All images
    NSMutableArray *images = [[NSMutableArray alloc] init];
        for (Photo *photo in self.imagesArray) {
            [images addObject:photo.image];
        }
    [self.allImagesDictionary setObject:images forKey:@"All Photos"];
    
// Categories
    NSArray *categories = [self.imagesArray valueForKeyPath:@"@distinctUnionOfObjects.category"];
    for (int i = 0; i <= categories.count - 1; i++) {
        NSMutableArray *oneCategory = [[NSMutableArray alloc] init];
        for (Photo *photo in self.imagesArray) {
            if ([photo.category isEqualToString:categories[i]]) {
                [oneCategory addObject:photo.image];
            }
        }
        [self.categoryDictionary setObject:oneCategory forKey:categories[i]];
    }

// Locations
    NSArray *locations = [self.imagesArray valueForKeyPath:@"@distinctUnionOfObjects.location"];
    for (int i = 0; i <= locations.count - 1; i++) {
        NSMutableArray *oneLocation = [[NSMutableArray alloc] init];
        for (Photo *photo in self.imagesArray) {
            if ([photo.location isEqualToString:locations[i]]) {
                [oneLocation addObject:photo.image];
            }
        }
        [self.locationDictionary setObject:oneLocation forKey:locations[i]];
    }
    
// To start
    self.imagesDictionary = self.allImagesDictionary;
    
    [self.collectionView setDataSource:self];
    self.flowLayout.headerReferenceSize =  CGSizeMake(CGRectGetWidth(self.collectionView.frame), 30);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.imagesDictionary.allKeys.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *sortedKeys = [self.imagesDictionary.allKeys sortedArrayUsingSelector:@selector(compare:)];
    int numberOfItems = (int)[[self.imagesDictionary objectForKey:sortedKeys[section]] count];
    return numberOfItems;
}

- (CollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSArray *sortedKeys = [self.imagesDictionary.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSArray *array = [self.imagesDictionary objectForKey:sortedKeys[indexPath.section]];
    cell.backgroundColor = [UIColor colorWithRed:136.0/255.0 green:212.0/255.0 blue:152.0/255.0 alpha:1.0];
    cell.imageView.image = array[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    Header *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
    NSArray *sortedKeys = [self.imagesDictionary.allKeys sortedArrayUsingSelector:@selector(compare:)];
    header.headerLabel.text = sortedKeys[indexPath.section];
    return header;
}

- (IBAction)pressedSegment:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.imagesDictionary = self.allImagesDictionary;
        [self.collectionView reloadData];
    } else if (sender.selectedSegmentIndex == 1) {
        self.imagesDictionary = self.categoryDictionary;
        [self.collectionView reloadData];
    } else if (sender.selectedSegmentIndex == 2) {
        self.imagesDictionary = self.locationDictionary;
        [self.collectionView reloadData];
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
