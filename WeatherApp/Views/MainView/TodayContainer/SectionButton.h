//
//  SectionButton.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

// The SectionButton class provides a custom UIButton with transparency animation functionality.
@interface SectionButton : UIButton

// Methods to animate transpareny on and off
-(void)animateOpacityOn;
-(void)animateOpacityOff;

@end
