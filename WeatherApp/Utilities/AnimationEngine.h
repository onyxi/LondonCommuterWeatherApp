//
//  AnimationEngine.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 31/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimationEngine : NSObject

+ (void) animateConstraint:(NSLayoutConstraint*) constraint toValue:(CGFloat) newValue withDuration:(CGFloat) duration forView:(UIView*) view;

+ (void) animateOpactiyOnForView:(UIView*) view withDuration:(CGFloat) duration;
+ (void) animateOpactiyOffForView:(UIView*) view withDuration:(CGFloat) duration;

@end
