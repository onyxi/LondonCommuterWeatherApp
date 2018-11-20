//
//  JourneyDetailsViewModel.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "JourneyDetailsViewModel.h"


@implementation JourneyDetailsViewModel {
    NSString*journeyType;
    NSArray<Forecast*>*journeyForecasts;
    Forecast*hour1;
    Forecast*hour2;
    Forecast*hour3;
}

// Initializer takes array of Forecast objects and a String to identify the object as being for the "am" or "pm" JourneyDetailsView object. Instance properties are assigned by using the helper methods to transform the data contained in the array Forecast objects
-(id)initWithForecasts:(NSArray<Forecast*>*)forecasts andJourneyTimeAMorPM:(NSString*)journeyTime {
    
    // assign identification of journey
    journeyType = journeyTime;
    
    // get journey Forecast objects from all Forecasts
    [self getJourneyForecastsFromAllForecasts:forecasts];
    
    // get transformed values for JourneyDetailsView UI outlets using helper methods
    self.hour1Time = [self getTimeStringFromTimeStamp:hour1.timeStamp];
    self.hour1Icon = [self getIconFromConditionsCode:hour1.conditionsCode];
    self.hour1Precipitation = [self getPrecipitationStringFromProbability:hour1.precipitationProbability];
    self.hour1Wind = [self getWindStringFromWindSpeed:hour1.windSpeed];
    self.hour1Temperature = [self getTemperatureStringFromTemperature:hour1.temperature];
    
    self.hour2Time = [self getTimeStringFromTimeStamp:hour2.timeStamp];
    self.hour2Icon = [self getIconFromConditionsCode:hour2.conditionsCode];
    self.hour2Precipitation = [self getPrecipitationStringFromProbability:hour2.precipitationProbability];
    self.hour2Wind = [self getWindStringFromWindSpeed:hour2.windSpeed];
    self.hour2Temperature = [self getTemperatureStringFromTemperature:hour2.temperature];
    
    self.hour3Time = [self getTimeStringFromTimeStamp:hour3.timeStamp];
    self.hour3Icon = [self getIconFromConditionsCode:hour3.conditionsCode];
    self.hour3Precipitation = [self getPrecipitationStringFromProbability:hour3.precipitationProbability];
    self.hour3Wind = [self getWindStringFromWindSpeed:hour3.windSpeed];
    self.hour3Temperature = [self getTemperatureStringFromTemperature:hour3.temperature];
    
    return self;
}


// This method filters the array of Forecast objects to identify the Forecasts in the correct time frame - according to stored journey times
-(void)getJourneyForecastsFromAllForecasts:(NSArray<Forecast*>*)allForecasts {
    journeyForecasts =  [NSArray arrayWithObjects: allForecasts[0], allForecasts[1], allForecasts[2], nil];
    hour1 = journeyForecasts[0];
    hour2 = journeyForecasts[1];
    hour3 = journeyForecasts[2];
}

// This method returns a String representing the weather conditions of a Forecast - categorised
// using the code meanings listed at https://www.weatherbit.io/api/codes
-(UIImage*)getIconFromConditionsCode:(NSInteger)conditionsCode {
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
        if ([journeyType isEqualToString:@"am"]) {
            iconImageName = @"rain_s";
        } else if ([journeyType isEqualToString:@"pm"]) {
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
        if ([journeyType isEqualToString:@"am"]) {
            iconImageName = @"chancerain_s";
        } else if ([journeyType isEqualToString:@"pm"]) {
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
        if ([journeyType isEqualToString:@"am"]) {
            iconImageName = @"cloudy_s";
        } else if ([journeyType isEqualToString:@"pm"]) {
            iconImageName = @"nt_cloudy_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 802 ||
        conditionsCode == 803) {
        if ([journeyType isEqualToString:@"am"]) {
            iconImageName = @"partlycloudy_s";
        } else if ([journeyType isEqualToString:@"pm"]) {
            iconImageName = @"nt_partlycloudy_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    if (conditionsCode == 800 ||
        conditionsCode == 801) {
        if ([journeyType isEqualToString:@"am"]) {
            iconImageName = @"clear_s";
        } else if ([journeyType isEqualToString:@"pm"]) {
            iconImageName = @"nt_clear_s";
        }
        return [UIImage imageNamed:iconImageName];
    }
    return nil;
}


// This method returns a formatted String to show a given Forecast object's precipitationProbability property with a '%' suffix
-(NSString*)getPrecipitationStringFromProbability:(double)precipitationProbability {
    int popInt = (int)precipitationProbability;
    return [NSString stringWithFormat: @"%d%%", popInt];
}


// This method returns a formatted String to show a given Forecast object's windSpeed property with a 'mph' suffix
-(NSString*)getWindStringFromWindSpeed:(double)windSpeed {
    int wdSpdInt = (int)windSpeed;
    return [NSString stringWithFormat: @"%dmph", wdSpdInt];
}


// This method returns a formatted String to show a given Forecast object's temperature property with a '•C' suffix
-(NSString*)getTemperatureStringFromTemperature:(double)temperature {
    int temperatureInt = (int)temperature;
    return [NSString stringWithFormat: @"%d%@C", temperatureInt, @"\u00B0"];
}


// This method returns a formatted String to show a given Forecast object's timeStamp property as the hour of day with 'am/pm' suffix
-(NSString*)getTimeStringFromTimeStamp:(NSInteger)timeStamp {
    
    // convert timeStamp to NSDate and get hour component
    NSTimeInterval timeInterval=timeStamp;
    NSDate *dateFromTimeStamp = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *timeStampComponents = [calendar components:(NSCalendarUnitHour) fromDate:dateFromTimeStamp];
    NSInteger timeStampHour = timeStampComponents.hour;
    
    // get appropriate suffix
    NSString * timeSuffix = @"am";
    if (timeStampHour >= 12) {
        timeSuffix = @"pm";
    }
    if (timeStampHour > 12) {
        timeStampHour -= 12;
    }
    
    // return string with hour component and suffix
    return [NSString stringWithFormat: @"%ld%@", (long)timeStampHour, timeSuffix];
}


@end
