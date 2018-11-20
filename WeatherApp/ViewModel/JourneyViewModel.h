//
//  JourneyViewModel.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeatherApp-Swift.h"

// The JourneyViewModel class provides usable data values ready to be displayed in a JourneyView object. An array of Forecast objects (part of the app's model) is processed and their properties transformed to provide formatted NSStrings and UIImages to be assigned to UILables and UIImageViews.
@interface JourneyViewModel : NSObject

// Initializer takes array of Forecast objects and a String to identify the object as being for the "am" or "pm" JourneyView object
-(id)initWithForecasts:(NSArray<Forecast*>*)forecasts andJourneyTimeAMorPM:(NSString*)journeyTime;

// properties holding references to usable values for a JourneyView object's outlets
@property(weak,nonatomic) UIImage * backgroundImage;

@property(weak,nonatomic) UIImage * iconCoat;
@property(weak,nonatomic) UIImage * iconSunglasses;
@property(weak,nonatomic) UIImage * iconUmbrella;

@property(weak,nonatomic) UIImage * summaryIcon;
@property(weak,nonatomic) NSString * summaryLocation;
@property(weak,nonatomic) NSString * summaryTemperature;

// if this variable is set to true, JourneyView's 'tomorrow' UILabel is displayed
@property BOOL showNextDay;

@end
