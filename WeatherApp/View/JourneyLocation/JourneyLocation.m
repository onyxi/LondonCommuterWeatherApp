//
//  JourneyLocation.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 23/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "JourneyLocation.h"

@implementation JourneyLocation

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void) customInit {
    
}

@end
