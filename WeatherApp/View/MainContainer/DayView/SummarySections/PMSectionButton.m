//
//  PMSectionButton.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 01/04/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "PMSectionButton.h"
#import "AnimationEngine.h"

@implementation PMSectionButton

- (void)drawRect:(CGRect)rect {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            
                            (id)[UIColor colorWithRed:150.0/255.0 green:190.0/255.0 blue:229.0/255.0 alpha:1.0].CGColor,
                            (id)[UIColor colorWithRed:150.0/255.0 green:190.0/255.0 blue:229.0/255.0 alpha:0.7].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.1f],
                               [NSNumber numberWithFloat:1.0f],
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
