//
//  AnimationEngine.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 31/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "AnimationEngine.h"
#import <UIKit/UIKit.h>

 
@implementation AnimationEngine

// This method animates the value of a layout constraint for a given View to a given value over a given time duration
+ (void) animateConstraint:(NSLayoutConstraint*) constraint toValue:(CGFloat) newValue withDuration:(CGFloat) duration forView:(UIView*) view {
    
    [view layoutIfNeeded];
    constraint.constant = newValue;
    [UIView animateWithDuration:duration
                     animations:^{
                         [view layoutIfNeeded];
                     }];
}

// This method animates the opacity of a given View to fully opaque in a given time duration
+ (void) animateOpactiyOnForView:(UIView*) view withDuration:(CGFloat) duration {
    [UIView animateWithDuration:duration animations:^(void) {
        view.alpha = 1.0;
    }];
}

// This method animates the opacity of a given View to transparent in a given time duration
+ (void) animateOpactiyOffForView:(UIView*) view withDuration:(CGFloat) duration {
    [UIView animateWithDuration:duration animations:^(void) {
        view.alpha = 0.02;
    }];
}

@end

