//
//  JourneyDetailsViewModel.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "WeatherApp-Swift.h"

NS_ASSUME_NONNULL_BEGIN

// The JourneyDetailsViewModel class provides usable data values ready to be displayed in a JourneyDetailsView object. An array of Forecast objects (part of the app's model) is processed and their properties transformed to provide formatted NSStrings and UIImages to be assigned to UILables and UIImageViews.
@interface JourneyDetailsViewModel : NSObject

// Initializer takes array of Forecast objects and a String to identify the object as being for the "am" or "pm" JourneyDetailsView object
-(id)initWithForecasts:(NSArray<Forecast*>*)forecasts andJourneyTimeAMorPM:(NSString*)journeyTime;

// properties holding references to usable values for a JourneyDetailsView object's outlets
@property(weak,nonatomic) NSString * hour1Time;
@property(weak,nonatomic) UIImage * hour1Icon;
@property(weak,nonatomic) NSString * hour1Precipitation;
@property(weak,nonatomic) NSString * hour1Wind;
@property(weak,nonatomic) NSString * hour1Temperature;

@property(weak,nonatomic) NSString * hour2Time;
@property(weak,nonatomic) UIImage * hour2Icon;
@property(weak,nonatomic) NSString * hour2Precipitation;
@property(weak,nonatomic) NSString * hour2Wind;
@property(weak,nonatomic) NSString * hour2Temperature;

@property(weak,nonatomic) NSString * hour3Time;
@property(weak,nonatomic) UIImage * hour3Icon;
@property(weak,nonatomic) NSString * hour3Precipitation;
@property(weak,nonatomic) NSString * hour3Wind;
@property(weak,nonatomic) NSString * hour3Temperature;

@end

NS_ASSUME_NONNULL_END
