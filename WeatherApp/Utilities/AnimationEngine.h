//
//  AnimationEngine.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 31/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// The AnimationEngine provides animation functionality. 
@interface AnimationEngine : NSObject

// This method animates the value of a layout constraint for a given View to a given value over a given time duration
+ (void) animateConstraint:(NSLayoutConstraint*) constraint toValue:(CGFloat) newValue withDuration:(CGFloat) duration forView:(UIView*) view;

// This method animates the opacity of a given View to fully opaque in a given time duration
+ (void) animateOpactiyOnForView:(UIView*) view withDuration:(CGFloat) duration;

// This method animates the opacity of a given View to transparent in a given time duration
+ (void) animateOpactiyOffForView:(UIView*) view withDuration:(CGFloat) duration;

@end
