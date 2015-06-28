//
//  recipe.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

- (instancetype)initWithName:(NSString *)name
                 ingredients:(NSArray *)ingredients
                       steps:(NSArray *)steps
                      timers:(NSArray *)timers
                    imageURL:(NSURL*)imageURL
                 originalURL:(NSURL *)originalURL {
    if (self = [super init]) {
        _name = name;
        _ingredients = ingredients;
        _steps = steps;
        _timers = timers;
        _imageURL = imageURL;
        _originalURL = originalURL;
    }
    return self;
}

@end
