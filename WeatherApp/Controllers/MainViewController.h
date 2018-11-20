//
//  MainViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "WeatherApp-Swift.h"
#import "JourneyView.h"

// The MainViewController class handles lifecycle events for the main view of the application - including user interaction, coordination of data retrieval and animation of subviews.
@interface MainViewController : UIViewController<UIGestureRecognizerDelegate, SettingsDelegate, JourneyViewDelegate>
@end


