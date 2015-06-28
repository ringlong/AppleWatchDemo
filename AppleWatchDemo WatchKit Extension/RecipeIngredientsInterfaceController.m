//
//  RecipeIngredientsInterfaceController.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipeIngredientsInterfaceController.h"
#import "IngredientRowController.h"
#import "Recipe.h"
#import "Ingredient.h"

@interface RecipeIngredientsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;

@end

@implementation RecipeIngredientsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    if ([context isKindOfClass:[Recipe class]]) {
        Recipe *recipe = context;
        [self.table setNumberOfRows:recipe.ingredients.count withRowType:@"IngredientRow"];
        
        [recipe.ingredients enumerateObjectsUsingBlock:^(Ingredient *obj, NSUInteger idx, BOOL *stop) {
            IngredientRowController *controller = [self.table rowControllerAtIndex:idx];
            [controller.textLabel setText:obj.name.capitalizedString];
            [controller.measurementLabel setText:obj.quantity];
        }];
        
    }
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

@end



