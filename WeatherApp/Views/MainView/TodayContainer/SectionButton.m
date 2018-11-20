//
//  SectionButton.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "SectionButton.h"
#import "AnimationEngine.h"


@implementation SectionButton

CAGradientLayer* gradientLayer;

// This method sets the initial state of the button when it loads from storyboard - to transparent and not hidden
- (void)awakeFromNib {
    self.alpha = 0.02;
    [self setHidden:(NO)];
    [super awakeFromNib];
}

// This method animates the SectionButton to opaque
-(void)animateOpacityOn {
    [AnimationEngine animateOpactiyOnForView:self withDuration:0.2];
}

// This method animates the SectionButton to transparent
-(void)animateOpacityOff {
    [AnimationEngine animateOpactiyOffForView:self withDuration:0.2];
}

@end
