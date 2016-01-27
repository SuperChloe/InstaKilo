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

@interface CollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

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
    Photo *photo1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1606.jpg"] andCategory:@"Back"];
    Photo *photo2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1643.jpg"] andCategory:@"Sitting"];
    Photo *photo3 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1841.jpg"] andCategory:@"Sitting"];
    Photo *photo4 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1889.jpg"] andCategory:@"Back"];
    Photo *photo5 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1892.jpg"] andCategory:@"Back"];
    Photo *photo6 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1901.jpg"] andCategory:@"Sitting"];
    Photo *photo7 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1908.jpg"] andCategory:@"Sitting"];
    Photo *photo8 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1931.jpg"] andCategory:@"Sitting"];
    Photo *photo9 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_1932.jpg"] andCategory:@"Back"];
    Photo *photo10 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"IMG_2080.jpg"] andCategory:@"Back"];
    
    [self.imagesArray addObjectsFromArray:@[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesArray.count;
}

- (CollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [cell addSubview:imageView];
    Photo *photo = self.imagesArray[indexPath.row];
    imageView.image = photo.image;
    
    cell.backgroundColor = [UIColor blackColor];

    return cell;
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
