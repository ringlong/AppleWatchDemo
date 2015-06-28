//
//  RecipeDetailInterfaceController.m
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import "RecipeDetailInterfaceController.h"
#import "Recipe.h"

@interface RecipeDetailInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *textLabel;
@property (strong, nonatomic) Recipe *recipe;

@end

@implementation RecipeDetailInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    if ([context isKindOfClass:[Recipe class]]) {
        self.recipe = context;
        [self.textLabel setText:self.recipe.name];
    }
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier {
    return self.recipe;
}

@end



