//
//  RecipesInterfaceController.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipesInterfaceController.h"
#import "RecipeStore.h"
#import "Recipe.h"
#import "RecipeRowController.h"

@interface RecipesInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) RecipeStore *store;

@end

@implementation RecipesInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.store = [RecipeStore sharedRecipes];
    NSArray *recipes = self.store.recipes;
    
    [self.table setNumberOfRows:recipes.count withRowType:@"RecipeRowType"];
    
    [recipes enumerateObjectsUsingBlock:^(Recipe *obj, NSUInteger idx, BOOL *stop) {
        RecipeRowController *controller = [self.table rowControllerAtIndex:idx];
        [controller.textLabel setText:obj.name];
        [controller.ingredientsLabel setText:[NSString stringWithFormat:@"%@ ingredients", @(obj.ingredients.count)]];
    }];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    return self.store.recipes[rowIndex];
}

@end



