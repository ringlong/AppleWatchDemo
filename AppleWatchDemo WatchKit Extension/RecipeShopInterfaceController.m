//
//  RecipeShopInterfaceController.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipeShopInterfaceController.h"
#import "ItemTypeRowController.h"
#import "ItemRowController.h"
#import "ShoppingList.h"
#import "Ingredient.h"

@interface RecipeShopInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong, nonatomic) ShoppingList *list;

@end

@implementation RecipeShopInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.list = ShoppingList.sharedList;
    [self.table setRowTypes:self.list.rowTypes];
    [self.list.list enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {

        if ([obj[@"type"] isKindOfClass:[Ingredient class]]) {
            ItemRowController *controller = [self.table rowControllerAtIndex:idx];
            Ingredient *ingredient = obj[@"type"];
            [controller.textLabel setText:ingredient.name.capitalizedString];
            [controller.measurementLabel setText:ingredient.quantity];
        } else {
            ItemTypeRowController *controller = [self.table rowControllerAtIndex:idx];
            NSString *type = obj[@"type"];
            [controller.textLabel setText:type];
            [controller.image setImageNamed:type.lowercaseString];
        }
    }];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



