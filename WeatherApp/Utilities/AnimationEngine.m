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

+ (void) animateConstraint:(NSLayoutConstraint*) constraint toValue:(CGFloat) newValue withDuration:(CGFloat) duration forView:(UIView*) view {
    [view layoutIfNeeded];
    
    constraint.constant = newValue;
    
    [UIView animateWithDuration:duration
                     animations:^{
                         [view layoutIfNeeded];
                     }];
}

+ (void) animateOpactiyOnForView:(UIView*) view withDuration:(CGFloat) duration {
    [UIView animateWithDuration:duration animations:^(void) {
        view.alpha = 1.0;
    }];
}

+ (void) animateOpactiyOffForView:(UIView*) view withDuration:(CGFloat) duration {
    [UIView animateWithDuration:duration animations:^(void) {
        view.alpha = 0.02;
    }];
}

@end

