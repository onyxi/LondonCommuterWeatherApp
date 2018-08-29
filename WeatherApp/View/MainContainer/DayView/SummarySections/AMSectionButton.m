//
//  AMSectionButton.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 01/04/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "AMSectionButton.h"
#import "AnimationEngine.h"

@implementation AMSectionButton

- (void)drawRect:(CGRect)rect {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                           
                            (id)[UIColor colorWithRed:70.0/255.0 green:82.0/255.0 blue:105.0/255.0 alpha:0.7].CGColor,
                            (id)[UIColor colorWithRed:70.0/255.0 green:82.0/255.0 blue:105.0/255.0 alpha:1.0].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:0.9f],
                               nil];
    
    [self.layer addSublayer:gradientLayer];
    [self setAlpha:0.02];
}


-(void)animateOpacityOn {
    [AnimationEngine animateOpactiyOnForView:self withDuration:0.2];
}

-(void)animateOpacityOff {
    [AnimationEngine animateOpactiyOffForView:self withDuration:0.2];
}

@end

