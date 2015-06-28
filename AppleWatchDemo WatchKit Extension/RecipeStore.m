//
//  RecipeStore.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipeStore.h"
#import "Ingredient.h"
#import "Recipe.h"

static NSString * const kRecipesFileName = @"Recipes";
static NSString * const kRecipesFileExtension = @"json";

@interface RecipeStore ()

@property (nonatomic, strong) NSURL *pathURL;

@end

@implementation RecipeStore

+ (instancetype)sharedRecipes {
    static dispatch_once_t onceToken;
    static RecipeStore *store = nil;
    dispatch_once(&onceToken, ^{
        store = [[RecipeStore alloc] init];
    });
    return store;
}

- (instancetype)init {
    if (self = [super init]) {
        NSData *jsonData = [NSData dataWithContentsOfURL:self.pathURL];
        _recipes = [self recipesFromArray:[self recipesFromData:jsonData]];
    }
    return self;
}

- (NSURL *)pathURL {
    if (!_pathURL) {
        _pathURL = [NSBundle.mainBundle URLForResource:kRecipesFileName withExtension:kRecipesFileExtension];
    }
    return _pathURL;
}

- (NSArray *)recipesFromData:(NSData *)data {
    NSArray *list = [NSArray array];
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if ([object isKindOfClass:[NSArray class]]) {
        list = object;
    }
    return list;
}

- (NSMutableArray *)recipesFromArray:(NSArray *)array {
    NSMutableArray *recipesList = [NSMutableArray array];
    for (NSDictionary *obj in array) {
        NSString *name = obj[@"name"];
        NSArray *steps = obj[@"steps"];
        NSArray *timers = obj[@"timers"];
        NSString *imageURL = obj[@"imageURL"];
        NSString *originalURL = obj[@"originalURL"];
        NSArray *ingredients = obj[@"ingredients"];
        
        NSMutableArray *ingredientList = [NSMutableArray arrayWithCapacity:ingredients.count];
        for (NSDictionary *tempDict in ingredients) {
            Ingredient *ingredient = [[Ingredient alloc] initWithDictionary:tempDict];
            [ingredientList addObject:ingredient];
        }
        
        Recipe *recipe = [[Recipe alloc] initWithName:name
                                          ingredients:ingredientList
                                                steps:steps
                                               timers:timers
                                             imageURL:[NSURL URLWithString:imageURL]
                                          originalURL:[NSURL URLWithString:originalURL]];
        [recipesList addObject:recipe];
        
    }
    return recipesList;
}

@end
