//
//  StepRowController.h
//  AppleWatchDemo
//
//  Created by Vanessa on 15/6/28.
//  Copyright (c) 2015年 Vanessa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface StepRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *stepLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *directionsLabel;

@end
