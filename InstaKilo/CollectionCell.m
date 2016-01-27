//
//  CollectionCell.m
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (instancetype)init {
    self = [super init];
    if (self) {
        _imageView.image = [UIImage imageNamed:@"IMG_1606.jpg"];
    }
    return self;
}

@end
