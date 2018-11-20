//
//  WeekViewModel.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "WeekViewModel.h"

@implementation WeekViewModel {
    NSArray<Forecast*>*homeLocationForecasts;
    NSArray<Forecast*>*workLocationForecasts;
    Forecast*day1Home;
    Forecast*day1Work;
    Forecast*day2Home;
    Forecast*day2Work;
    Forecast*day3Home;
    Forecast*day3Work;
    Forecast*day4Home;
    Forecast*day4Work;
    Forecast*day5Home;
    Forecast*day5Work;
    Forecast*day6Home;
    Forecast*day6Work;
    Forecast*day7Home;
    Forecast*day7Work;
}


// Initializer takes two arrays of Forecast objects - one for the home location and one for the work location. Instance properties are assigned by using the helper methods to transform the data contained in the array Forecast objects
-(id) initWithHomeLocationForecasts:(NSArray<Forecast*>*)homeForecasts andWorkLocationForecasts:(NSArray<Forecast*>*)workForecasts {
    
    // get Forecast objects for next 7 days from all Forecasts
    homeLocationForecasts = [self getWeekForecastsFromAllForecasts:homeForecasts];
    workLocationForecasts = [self getWeekForecastsFromAllForecasts:workForecasts];
    
    day1Home = homeLocationForecasts[0];
    day2Home = homeLocationForecasts[1];
    day3Home = homeLocationForecasts[2];
    day4Home = homeLocationForecasts[3];
    day5Home = homeLocationForecasts[4];
    day6Home = homeLocationForecasts[5];
    day7Home = homeLocationForecasts[6];
    
    day1Work = workLocationForecasts[0];
    day2Work = workLocationForecasts[1];
    day3Work = workLocationForecasts[2];
    day4Work = workLocationForecasts[3];
    day5Work = workLocationForecasts[4];
    day6Work = workLocationForecasts[5];
    day7Work = workLocationForecasts[6];
    
    
    // get transformed values for WeekView UI outlets using helper methods
    _day1Name = [self getDayNameFromTimeStamp:day1Home.timeStamp];
    _day1AMIcon = [self getIconFromConditionsCode:day1Home.conditionsCode forAMorPM:@"am"];
    _day1PMIcon = [self getIconFromConditionsCode:day1Work.conditionsCode forAMorPM:@"pm"];
    
    _day2Name = [self getDayNameFromTimeStamp:day2Home.timeStamp];
    _day2AMIcon = [self getIconFromConditionsCode:day2Home.conditionsCode forAMorPM:@"am"];
    _day2PMIcon = [self getIconFromConditionsCode:day2Work.conditionsCode forAMorPM:@"pm"];
    
    _day3Name = [self getDayNameFromTimeStamp:day3Home.timeStamp];
    _day3AMIcon = [self getIconFromConditionsCode:day3Home.conditionsCode forAMorPM:@"am"];
    _day3PMIcon = [self getIconFromConditionsCode:day3Work.conditionsCode forAMorPM:@"pm"];
    
    _day4Name = [self getDayNameFromTimeStamp:day4Home.timeStamp];
    _day4AMIcon = [self getIconFromConditionsCode:day4Home.conditionsCode forAMorPM:@"am"];
    _day4PMIcon = [self getIconFromConditionsCode:day4Work.conditionsCode forAMorPM:@"pm"];
    
    _day5Name = [self getDayNameFromTimeStamp:day5Home.timeStamp];
    _day5AMIcon = [self getIconFromConditionsCode:day5Home.conditionsCode forAMorPM:@"am"];
    _day5PMIcon = [self getIconFromConditionsCode:day5Work.conditionsCode forAMorPM:@"pm"];
    
    _day6Name = [self getDayNameFromTimeStamp:day6Home.timeStamp];
    _day6AMIcon = [self getIconFromConditionsCode:day6Home.conditionsCode forAMorPM:@"am"];
    _day6PMIcon = [self getIconFromConditionsCode:day6Work.conditionsCode forAMorPM:@"pm"];
    
    _day7Name = [self getDayNameFromTimeStamp:day7Home.timeStamp];
    _day7AMIcon = [self getIconFromConditionsCode:day7Home.conditionsCode forAMorPM:@"am"];
    _day7PMIcon = [self getIconFromConditionsCode:day7Work.conditionsCode forAMorPM:@"pm"];
    
    return self;
}


// This method filters the array of Forecast objects to identify the daily Forecasts in the correct time frame - next 7 days (starting tomorrow)
-(NSArray<Forecast*>*)getWeekForecastsFromAllForecasts:(NSArray<Forecast*>*)allForecasts {
    return [NSArray arrayWithObjects:
            allForecasts[1],
            allForecasts[2],
            allForecasts[3],
            allForecasts[4],
            allForecasts[5],
            allForecasts[6],
            allForecasts[7],
            nil];
}


// This method returns a formatted String to show a given Forecast object's timeStamp property as the name of day.
-(NSString*)getDayNameFromTimeStamp:(NSInteger)timeStamp {
    NSTimeInterval timeInterval = timeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"EEEE"];
    NSString *dateString=[dateformatter stringFromDate:date];
    return dateString;
}


// This method returns a String representing the weather conditions of a Forecast - categorised
// using the code meanings listed at https://www.weatherbit.io/api/codes
-(UIImage*)getIconFromConditionsCode:(NSInteger)conditionsCode forAMorPM:(NSString*)AMorPM{
    NSString*iconImageName;
    if (conditionsCode == 200 ||
        conditionsCode == 201 ||
        conditionsCode == 202 ||
        conditionsCode == 230 ||
        conditionsCode == 231 ||
        conditionsCode == 232 ||
        conditionsCode == 233 ||
        conditionsCode == 502 ||
        conditionsCode == 511 ||
        conditionsCode == 522 ||
        conditionsCode == 602 ||
        conditionsCode == 610 ||
        conditionsCode == 611 ||
        conditionsCode == 612 ||
        conditionsCode == 622) {
        if ([AMorPM isEqualToString:@"am"]) {
            iconImageName = @"rain_s";
        } else if ([AMorPM isEqualToString:@"pm"]) {
            iconImageName = @"nt_rain_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 300 ||
        conditionsCode == 301 ||
        conditionsCode == 302 ||
        conditionsCode == 500 ||
        conditionsCode == 501 ||
        conditionsCode == 520 ||
        conditionsCode == 521 ||
        conditionsCode == 600 ||
        conditionsCode == 601 ||
        conditionsCode == 621 ||
        conditionsCode == 623) {
        if ([AMorPM isEqualToString:@"am"]) {
            iconImageName = @"chancerain_s";
        } else if ([AMorPM isEqualToString:@"pm"]) {
            iconImageName = @"nt_chancerain_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 700 ||
        conditionsCode == 711 ||
        conditionsCode == 721 ||
        conditionsCode == 731 ||
        conditionsCode == 741 ||
        conditionsCode == 751 ||
        conditionsCode == 804 ||
        conditionsCode == 900) {
        if ([AMorPM isEqualToString:@"am"]) {
            iconImageName = @"cloudy_s";
        } else if ([AMorPM isEqualToString:@"pm"]) {
            iconImageName = @"nt_cloudy_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 802 ||
        conditionsCode == 803) {
        if ([AMorPM isEqualToString:@"am"]) {
            iconImageName = @"partlycloudy_s";
        } else if ([AMorPM isEqualToString:@"pm"]) {
            iconImageName = @"nt_partlycloudy_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 800 ||
        conditionsCode == 801) {
        if ([AMorPM isEqualToString:@"am"]) {
            iconImageName = @"clear_s";
        } else if ([AMorPM isEqualToString:@"pm"]) {
            iconImageName = @"nt_clear_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    return nil;
}




@end
