//
//  ShoppingList.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "ShoppingList.h"
#import "RecipeStore.h"
#import "Ingredient.h"
#import "Recipe.h"

@implementation ShoppingList

+ (instancetype)sharedList {
    static dispatch_once_t onceToken;
    static ShoppingList *list = nil;
    dispatch_once(&onceToken, ^{
        list = [[ShoppingList alloc] init];
    });
    return list;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
        
        for (Recipe *recipe in RecipeStore.sharedRecipes.recipes) {
            Ingredient *firstIngredient = recipe.ingredients.firstObject;
            NSString *type = firstIngredient.type;
            [_list addObject:@{@"rowType": @"ItemTypeRow",
                               @"type": type}];
            
            for (Ingredient *ingredient in recipe.ingredients) {
                type = ingredient.type;
                [_list addObject:@{@"rowType": @"ItemRow",
                                   @"type": ingredient}];
            }
        }
    }
    return _list;
}

- (NSMutableArray *)rowTypes {
    if (!_rowTypes) {
        _rowTypes = [NSMutableArray arrayWithCapacity:self.list.count];
        for (NSDictionary *dict in self.list) {
            NSString *rowType = dict[@"rowType"];
            [_rowTypes addObject:rowType];
        }
    }
    return _rowTypes;
}

@end
