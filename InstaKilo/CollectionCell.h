//
//  CollectionCell.h
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface CollectionCell : UICollectionViewCell

@property (nonatomic, strong) Photo *photo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
