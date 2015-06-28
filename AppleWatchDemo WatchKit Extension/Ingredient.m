//
//  Ingredient.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

- (instancetype)initWithName:(NSString *)name quantity:(NSString *)quantity type:(NSString *)type {
    if (self = [super init]) {
        _name = name;
        _quantity = quantity;
        _type = type;
        _purchased = FALSE;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)data {
    if (self = [super init]) {
        _name = data[@"name"];
        _quantity = data[@"quantity"];
        _type = data[@"type"];
//        _type = [self ingredientTypeByTypeString:data[@"type"]];
        _purchased = FALSE;
    }
    return self;
}

- (IngredientType)ingredientTypeByTypeString:(NSString *)typeString {
    if ([typeString isEqualToString:@"Meat"]) {
        return IngredientTypeMeat;
    } else if ([typeString isEqualToString:@"Dairy"]) {
        return IngredientTypeDairy;
    } else if ([typeString isEqualToString:@"Produce"]) {
        return IngredientTypeProduce;
    } else if ([typeString isEqualToString:@"Baking"]) {
        return IngredientTypeBaking;
    } else if ([typeString isEqualToString:@"Drinks"]) {
        return IngredientTypeDrinks;
    } else if ([typeString isEqualToString:@"Misc"]) {
        return IngredientTypeMisc;
    } else if ([typeString isEqualToString:@"Condiments"]) {
        return IngredientTypeCondiments;
    } else if ([typeString isEqualToString:@"Pasta"]) {
        return IngredientTypePasta;
    }
    return IngredientTypeMeat;
}

@end
