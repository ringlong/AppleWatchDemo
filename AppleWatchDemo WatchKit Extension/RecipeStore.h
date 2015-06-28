//
//  RecipeStore.h
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecipeStore : NSObject

@property (nonatomic, strong) NSArray *recipes;

+ (instancetype)sharedRecipes;

@end
