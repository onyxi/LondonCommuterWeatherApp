//
//  settingsRoundedRect.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 29/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "SettingsRoundedRect.h"

@implementation SettingsRoundedRect

//- (void)viewDidLoad {
//
//
//
//}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = true;
         NSLog(@"test");
    }
    return self;
}



@end
