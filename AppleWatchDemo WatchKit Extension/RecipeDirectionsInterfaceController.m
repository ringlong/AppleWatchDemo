//
//  RecipeDirectionsInterfaceController.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipeDirectionsInterfaceController.h"
#import "StepRowController.h"
#import "Recipe.h"


@interface RecipeDirectionsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;

@end

@implementation RecipeDirectionsInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    if ([context isKindOfClass:[Recipe class]]) {
        Recipe *recipe = context;
        [self.table setNumberOfRows:recipe.steps.count withRowType:@"StepRow"];
        
        [recipe.steps enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
            StepRowController *controller = [self.table rowControllerAtIndex:idx];
            [controller.stepLabel setText:[NSString stringWithFormat:@"Step %@", @(idx + 1)]];
            [controller.directionsLabel setText:obj];
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



