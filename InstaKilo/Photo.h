//
//  Photo.h
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *category;

- (instancetype)initWithImage:(UIImage *)image andCategory:(NSString *)category;

@end
