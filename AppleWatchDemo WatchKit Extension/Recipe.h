//
//  recipe.h
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ingredient;

@interface Recipe : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *ingredients;     // 原料
@property (nonatomic, strong) NSArray *steps;           // 步骤
@property (nonatomic, strong) NSArray *timers;          // 时间
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) NSURL *originalURL;

- (instancetype)initWithName:(NSString *)name
                 ingredients:(NSArray *)ingredients
                       steps:(NSArray *)steps
                      timers:(NSArray *)timers
                    imageURL:(NSURL*)imageURL
                 originalURL:(NSURL *)originalURL;

@end
