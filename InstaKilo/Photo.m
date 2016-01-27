//
//  Photo.m
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)image andCategory:(NSString *)category {
    self = [super init];
    if (self) {
        _image = image;
        _category = category;
    }
    return self;
}

@end
