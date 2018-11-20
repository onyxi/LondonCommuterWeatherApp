//
//  JourneyViewModel.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 22/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "JourneyViewModel.h"
#import "WeatherApp-Swift.h"


@implementation JourneyViewModel {
    NSString*journeyType;
    NSArray<Forecast*>*journeyForecasts;
    NSString * summaryConditions;
    Forecast*hour1;
    Forecast*hour2;
    Forecast*hour3;
}


// Initializer takes array of Forecast objects and a String to identify the object as being for the "am" or "pm" JourneyView object. Instance properties are assigned by using the helper methods to transform the data contained in the array Forecast objects
-(id)initWithForecasts:(NSArray<Forecast*>*)forecasts andJourneyTimeAMorPM:(NSString*)journeyTime {
    
    // assign identification of journey
    journeyType = journeyTime;
    
    // get journey Forecast objects from all Forecasts
    [self getJourneyForecastsFromAllForecasts:forecasts];
    
    // identify summary conditions for whole journey
    summaryConditions = [self getSummaryConditions];
    
    // get transformed values for JourneyView UI outlets using helper methods
    _summaryIcon = [self getSummaryIcon];
    _summaryLocation = [self getLocationName];
    _summaryTemperature = [self getSummaryTemperature];
    
    _summaryTemperature = [self getSummaryTemperature];
    _iconCoat = [self getCoatIcon];
    _iconSunglasses = [self getSunglassesIcon];
    _iconUmbrella = [self getUmbrellaIcon];
    
    _backgroundImage = [self getBackgroundImageForSummaryConditions:summaryConditions];
    
    return self;
}


// This method filters the array of Forecast objects to identify the Forecasts in the correct time frame - according to stored journey times
-(void)getJourneyForecastsFromAllForecasts:(NSArray<Forecast*>*)allForecasts {
    
   journeyForecasts = [NSArray arrayWithObjects: allForecasts[0], allForecasts[1], allForecasts[2], nil];
    
    hour1 = journeyForecasts[0];
    hour2 = journeyForecasts[1];
    hour3 = journeyForecasts[2];
}



// This method returns a UIImage representing given weather conditions at the time of day that the journey takes place in (AM or PM)
-(UIImage*)getBackgroundImageForSummaryConditions:(NSString*)summaryConditions {
    
    // String to hold reference to the appropriate image name
    NSString* backgroundImageName;
    
    // get icon image name for AM journey
    if ([journeyType isEqualToString:@"am"]) {
        if ([summaryConditions isEqualToString: @"heavyRain"]) {
            backgroundImageName = @"amRain";
        } else if ([summaryConditions isEqualToString: @"lightRain"]) {
            backgroundImageName = @"amChanceRain";
        } else if ([summaryConditions isEqualToString: @"cloudy"]) {
            backgroundImageName = @"amCloudy";
        } else if ([summaryConditions isEqualToString: @"partlyCloudy"]) {
            backgroundImageName = @"amMostlyCloudy";
        } else if ([summaryConditions isEqualToString: @"clear"]) {
            backgroundImageName = @"amClear";
        }
    
    // get icon image name for PM journey
    } else if ([journeyType isEqualToString:@"pm"]) {
        if ([summaryConditions isEqualToString: @"heavyRain"]) {
            backgroundImageName = @"pmRain";
        } else if ([summaryConditions isEqualToString: @"lightRain"]) {
            backgroundImageName = @"pmChanceRain";
        } else if ([summaryConditions isEqualToString: @"cloudy"]) {
            backgroundImageName = @"pmCloudy";
        } else if ([summaryConditions isEqualToString: @"partlyCloudy"]) {
            backgroundImageName = @"pmMostlyCloudy";
        } else if ([summaryConditions isEqualToString: @"clear"]) {
            backgroundImageName = @"pmClear";
        }
        
    }
    
    // return UIImage constructed using the identified image name string
    return [UIImage imageNamed: backgroundImageName];
}


// This method returns a UIImage according to the Forecast objects temperatures - if any Forecast's temperature is low enough then the dark (highlighted) version of the coat icon is returned. If not, the light (greyed-out) version is returned.
-(UIImage*)getCoatIcon {
    NSString * coatIconName = @"coatLight";
    if (hour1.temperature < 15 || hour2.temperature < 15 || hour3.temperature < 15) {
        coatIconName = @"coatDark";
    }
    return [UIImage imageNamed: coatIconName];
}

// This method returns a UIImage according to the Forecast objects conditions code - if any Forecast's condition code represents 'clear' conditions, then the dark (highlighted) version of the sunglasses icon is returned. If not, the light (greyed-out) version is returned.
-(UIImage*)getSunglassesIcon {
    NSString * suglassesIconName = @"sunglassesLight";
    if (hour1.conditionsCode == 800 ||
        hour1.conditionsCode == 801 ||
        hour2.conditionsCode == 800 ||
        hour2.conditionsCode == 801 ||
        hour3.conditionsCode == 800 ||
        hour3.conditionsCode == 801) {
        suglassesIconName = @"sunglassesDark";
    }
    return [UIImage imageNamed: suglassesIconName];
}

// This method returns a UIImage according to the Forecast objects precipitation probability - if any Forecast's precipitation probability is more than 50%, then the dark (highlighted) version of the umbrella icon is returned. If not, the light (greyed-out) version is returned.
-(UIImage*)getUmbrellaIcon{
    NSString * umbrellaIconName = @"umbrellaLight";
    if (hour1.precipitationProbability > 50 ||
        hour2.precipitationProbability > 50 ||
        hour3.precipitationProbability > 50) {
        umbrellaIconName = @"umbrellaDark";
    }
    return [UIImage imageNamed: umbrellaIconName];
}

// This method returns the most severe temperature (furthest away from 20 degrees) from the journey Forecasts, as a String with a 'degrees celsius' suffix.
-(NSString*)getSummaryTemperature {
    NSInteger summaryTemperature = hour1.temperature;
    if (20 - hour2.temperature > 20 - summaryTemperature) {
        summaryTemperature = hour2.temperature;
    }
    if (20 - hour3.temperature > 20 - summaryTemperature) {
        summaryTemperature = hour2.temperature;
    }
    return [NSString stringWithFormat: @"%ld", summaryTemperature];
}

// This method returns the stored London borough associated with the JourneyView - according to the time of day (AM/Home or PM/Work)
-(nullable NSString*)getLocationName {
    if ([journeyType isEqualToString:@"am"]) {
        return [NSUserDefaults.standardUserDefaults objectForKey: Constants.instance.LOCATION_HOME];
    } else if ([journeyType isEqualToString:@"pm"]) {
        return [NSUserDefaults.standardUserDefaults objectForKey: Constants.instance.LOCATION_WORK];
    }
    return nil;
}

// This method returns a UIImage to represent the summary weather conditions identified for the journey - depending on whether the journey is AM or PM
-(UIImage*)getSummaryIcon  {
    
    // return summary icon for AM journey
    if ([journeyType isEqualToString:@"am"]) {
        if ([summaryConditions isEqualToString: @"heavyRain"]) {
            return [UIImage imageNamed: @"rain_l"];
        }
        if ([summaryConditions isEqualToString: @"lightRain"]) {
            return [UIImage imageNamed: @"chancerain_l"];
        }
        if ([summaryConditions isEqualToString: @"cloudy"]) {
            return [UIImage imageNamed: @"cloudy_l"];
        }
        if ([summaryConditions isEqualToString: @"partlyCloudy"]) {
            return [UIImage imageNamed: @"partlycloudy_l"];
        }
        if ([summaryConditions isEqualToString: @"clear"]) {
            return [UIImage imageNamed: @"clear_l"];
        }
        
    // return summary icon for PM journey
    } else if ([journeyType isEqualToString:@"pm"]) {
        if ([summaryConditions isEqualToString: @"heavyRain"]) {
            return [UIImage imageNamed: @"nt_rain_l"];
        }
        if ([summaryConditions isEqualToString: @"lightRain"]) {
            return [UIImage imageNamed: @"nt_chancerain_l"];
        }
        if ([summaryConditions isEqualToString: @"cloudy"]) {
            return [UIImage imageNamed: @"nt_cloudy_l"];
        }
        if ([summaryConditions isEqualToString: @"partlyCloudy"]) {
            return [UIImage imageNamed: @"nt_partlycloudy_l"];
        }
        if ([summaryConditions isEqualToString: @"clear"]) {
            return [UIImage imageNamed: @"nt_clear_l"];
        }
    }
    return nil;
}

// This method returns a String representing the summarised weather conditions of the journey - using the conditionsCode property of the Forecast objects categorised using the code meanings listed at https://www.weatherbit.io/api/codes
-(NSString*)getSummaryConditions {
    if (hour1.conditionsCode == 200 ||
        hour1.conditionsCode == 201 ||
        hour1.conditionsCode == 202 ||
        hour1.conditionsCode == 230 ||
        hour1.conditionsCode == 231 ||
        hour1.conditionsCode == 232 ||
        hour1.conditionsCode == 233 ||
        hour1.conditionsCode == 502 ||
        hour1.conditionsCode == 511 ||
        hour1.conditionsCode == 522 ||
        hour1.conditionsCode == 602 ||
        hour1.conditionsCode == 610 ||
        hour1.conditionsCode == 611 ||
        hour1.conditionsCode == 612 ||
        hour1.conditionsCode == 622) {
        return @"heavyRain";
    }
    if (hour1.conditionsCode == 300 ||
        hour1.conditionsCode == 301 ||
        hour1.conditionsCode == 302 ||
        hour1.conditionsCode == 500 ||
        hour1.conditionsCode == 501 ||
        hour1.conditionsCode == 520 ||
        hour1.conditionsCode == 521 ||
        hour1.conditionsCode == 600 ||
        hour1.conditionsCode == 601 ||
        hour1.conditionsCode == 621 ||
        hour1.conditionsCode == 623) {
        return @"lightRain";
    }
    if (hour1.conditionsCode == 700 ||
        hour1.conditionsCode == 711 ||
        hour1.conditionsCode == 721 ||
        hour1.conditionsCode == 731 ||
        hour1.conditionsCode == 741 ||
        hour1.conditionsCode == 751 ||
        hour1.conditionsCode == 804 ||
        hour1.conditionsCode == 900) {
        return @"cloudy";
    }
    if (hour1.conditionsCode == 802 ||
        hour1.conditionsCode == 803) {
        return @"partlyCloudy";
    }
    if (hour1.conditionsCode == 800 ||
        hour1.conditionsCode == 801) {
        return @"clear";
    }
    return nil;
}





@end
