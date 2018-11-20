//
//  WeekViewModel.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeatherApp-Swift.h"

// The WeekViewModel class provides usable data values ready to be displayed in a WeekView object. Two arrays of daily Forecast objects (one for the home location and one for the work location) are processed and their conditonsCode used to provide UIImages for UIImageView outlets.
@interface WeekViewModel : NSObject

// Initializer takes two arrays of Forecast objects - one for the home location and one for the work location.
-(id) initWithHomeLocationForecasts:(NSArray<Forecast*>*)homeForecasts andWorkLocationForecasts:(NSArray<Forecast*>*)workForecasts;

// properties holding references to usable values for a WeekView object's outlets
@property(weak,nonatomic) NSString * day1Name;
@property(weak,nonatomic) UIImage * day1AMIcon;
@property(weak,nonatomic) UIImage * day1PMIcon;

@property(weak,nonatomic) NSString * day2Name;
@property(weak,nonatomic) UIImage * day2AMIcon;
@property(weak,nonatomic) UIImage * day2PMIcon;

@property(weak,nonatomic) NSString * day3Name;
@property(weak,nonatomic) UIImage * day3AMIcon;
@property(weak,nonatomic) UIImage * day3PMIcon;

@property(weak,nonatomic) NSString * day4Name;
@property(weak,nonatomic) UIImage * day4AMIcon;
@property(weak,nonatomic) UIImage * day4PMIcon;

@property(weak,nonatomic) NSString * day5Name;
@property(weak,nonatomic) UIImage * day5AMIcon;
@property(weak,nonatomic) UIImage * day5PMIcon;

@property(weak,nonatomic) NSString * day6Name;
@property(weak,nonatomic) UIImage * day6AMIcon;
@property(weak,nonatomic) UIImage * day6PMIcon;

@property(weak,nonatomic) NSString * day7Name;
@property(weak,nonatomic) UIImage * day7AMIcon;
@property(weak,nonatomic) UIImage * day7PMIcon;

@end
