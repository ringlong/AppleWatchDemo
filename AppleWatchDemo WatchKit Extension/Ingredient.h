//
//  Ingredient.h
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IngredientType) {
    IngredientTypeMeat,
    IngredientTypeDairy,
    IngredientTypeProduce,
    IngredientTypeBaking,
    IngredientTypeDrinks,
    IngredientTypeMisc,
    IngredientTypeCondiments,
    IngredientTypePasta,
};

@interface Ingredient : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *quantity;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, assign) BOOL purchased;
//@property (nonatomic, assign) IngredientType type;

- (instancetype)initWithName:(NSString *)name quantity:(NSString *)quantity type:(NSString *)type;

- (instancetype)initWithDictionary:(NSDictionary *)data;

@end
