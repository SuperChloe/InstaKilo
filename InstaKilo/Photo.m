//
//  Photo.m
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)image category:(NSString *)category andLocation:(NSString *)location {
    self = [super init];
    if (self) {
        _image = image;
        _category = category;
        _location = location;
    }
    return self;
}

@end
