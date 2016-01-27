//
//  Photo.h
//  InstaKilo
//
//  Created by Chloe on 2016-01-27.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *location;

- (instancetype)initWithImage:(UIImage *)image category:(NSString *)category andLocation:(NSString *)location;

@end
