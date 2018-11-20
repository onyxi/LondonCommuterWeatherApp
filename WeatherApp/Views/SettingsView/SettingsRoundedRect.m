//
//  settingsRoundedRect.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 29/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "SettingsRoundedRect.h"

@implementation SettingsRoundedRect

// When initializing from code this method calls the 'setup' method to configure the view
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

// When initializing from Storyboard this method calls the 'setup' method to configure the view
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

// This method applies rounded corners to the view's layer
-(void)setup{
    self.layer.cornerRadius = 5.0;
}



@end
