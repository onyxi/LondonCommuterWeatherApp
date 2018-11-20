//
//  JourneyDetailsView.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "JourneyDetailsView.h"

@interface JourneyDetailsView()

// UI outlets
@property (weak, nonatomic) IBOutlet UILabel *hour1TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hour1Icon;
@property (weak, nonatomic) IBOutlet UILabel * hour1PrecipitacionLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour1WindLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour1TemperatureLabel;

@property (weak, nonatomic) IBOutlet UILabel *hour2TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hour2Icon;
@property (weak, nonatomic) IBOutlet UILabel * hour2PrecipitacionLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour2WindLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour2TemperatureLabel;

@property (weak, nonatomic) IBOutlet UILabel *hour3TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hour3Icon;
@property (weak, nonatomic) IBOutlet UILabel * hour3PrecipitacionLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour3WindLabel;
@property (weak, nonatomic) IBOutlet UILabel * hour3TemperatureLabel;

@end



@implementation JourneyDetailsView


// This method updates the UI outlets with the property values of a JourneyDetailsViewModel object when assigned to the journeyDetailsViewModel variable.
-(void)setJourneyDetailsViewModel:(JourneyDetailsViewModel *)journeyDetailsViewModel {
 
    // set hour 1 outlets
    [_hour1TimeLabel setText:(journeyDetailsViewModel.hour1Time)];
    [_hour1Icon setImage:(journeyDetailsViewModel.hour1Icon)];
    [_hour1PrecipitacionLabel setText:(journeyDetailsViewModel.hour1Precipitation)];
    [_hour1WindLabel setText:(journeyDetailsViewModel.hour1Wind)];
    [_hour1TemperatureLabel setText:(journeyDetailsViewModel.hour1Temperature)];
    
    // set hour 2 outlets
    [_hour2TimeLabel setText:(journeyDetailsViewModel.hour2Time)];
    [_hour2Icon setImage:(journeyDetailsViewModel.hour2Icon)];
    [_hour2PrecipitacionLabel setText:(journeyDetailsViewModel.hour2Precipitation)];
    [_hour2WindLabel setText:(journeyDetailsViewModel.hour2Wind)];
    [_hour2TemperatureLabel setText:(journeyDetailsViewModel.hour2Temperature)];
    
    // set hour 3 outlets
    [_hour3TimeLabel setText:(journeyDetailsViewModel.hour3Time)];
    [_hour3Icon setImage:(journeyDetailsViewModel.hour3Icon)];
    [_hour3PrecipitacionLabel setText:(journeyDetailsViewModel.hour3Precipitation)];
    [_hour3WindLabel setText:(journeyDetailsViewModel.hour3Wind)];
    [_hour3TemperatureLabel setText:(journeyDetailsViewModel.hour3Temperature)];
    
}

@end
