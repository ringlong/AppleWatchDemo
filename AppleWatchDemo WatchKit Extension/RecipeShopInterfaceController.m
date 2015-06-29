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

@property (strong, nonatomic) NSDictionary *cellTextAttributes;
@property (strong, nonatomic) NSDictionary *deleteLineTextAttributes;

@end

@implementation RecipeShopInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.cellTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.],
                                NSForegroundColorAttributeName: UIColor.whiteColor};
    
    self.deleteLineTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.],
                                      NSForegroundColorAttributeName: UIColor.lightGrayColor,
                                      NSStrikethroughStyleAttributeName: @(NSUnderlinePatternSolid | NSUnderlineStyleSingle)};
    
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

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    id controller = [table rowControllerAtIndex:rowIndex];
    if ([controller isKindOfClass:[ItemRowController class]]) {
        NSDictionary *dict = self.list.list[rowIndex];
        Ingredient *ingredient = dict[@"type"];
        NSString *text = ingredient.name.capitalizedString;
        
        ItemRowController *row = controller;
        [row.textLabel setAttributedText:[[NSAttributedString alloc] initWithString:text attributes:self.deleteLineTextAttributes]];
    }
}

- (IBAction)onClearAll {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.table.numberOfRows)];
    [self.table removeRowsAtIndexes:indexSet];
}

- (IBAction)onClearSection1 {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 6)];
    [self.table removeRowsAtIndexes:indexSet];
}

@end



