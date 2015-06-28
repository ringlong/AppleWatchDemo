//
//  ShoppingList.h
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingList : NSObject

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) NSMutableArray *rowTypes;

+ (instancetype)sharedList;

@end
