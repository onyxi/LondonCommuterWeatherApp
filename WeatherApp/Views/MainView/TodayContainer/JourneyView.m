//
//  JourneyView.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "JourneyView.h"
#import "AnimationEngine.h"

@interface JourneyView()

// UI outlets
@property (weak, nonatomic) IBOutlet UIImageView *summaryBG;
@property (weak, nonatomic) IBOutlet UIImageView *summaryIcon;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *tomorrowLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coatIcon;
@property (weak, nonatomic) IBOutlet UIImageView *sunglassesIcon;
@property (weak, nonatomic) IBOutlet  UIImageView *umbrellaIcon;
@property (weak, nonatomic) IBOutlet  UIButton *sectionButton;

@end



@implementation JourneyView


// This method updates the UI outlets with the property values of a JourneyViewModel object when assigned to the journeyViewModel variable.
-(void)setJourneyViewModel:(JourneyViewModel *)journeyViewModel {

    // set background image
    [_summaryBG setImage:(journeyViewModel.backgroundImage)];
    
    // set accessories icons
    [_coatIcon setImage:(journeyViewModel.iconCoat)];
    [_sunglassesIcon setImage:(journeyViewModel.iconSunglasses)];
    [_umbrellaIcon setImage:(journeyViewModel.iconUmbrella)];
    
    // set 'tomorrow' label as shown or hidden
    if (journeyViewModel.showNextDay == NO) {
        _tomorrowLabel.hidden = YES;
    }
    
    // set weather summary data
    [_summaryIcon setImage:(journeyViewModel.summaryIcon)];
    [_temperatureLabel setText:(journeyViewModel.summaryTemperature)];
    [_locationLabel setText:(journeyViewModel.summaryLocation)];
    
}




// This method notifies the delegate that this JourneyView object has been tapped by the user
- (IBAction)sectionButtonPressed:(id)sender {
    [_delegate journeyViewPressed: _journeyViewName];
}



// This method toggles on/off the transparency of the view's SectionButton subview
// (to better display hidden weather data when the view is animated by the delegating view-controller)
-(void)toggleButtonColor {
    if (_sectionButton.alpha == 1) {
        [AnimationEngine animateOpactiyOffForView:_sectionButton withDuration:0.2];
    } else {
        [AnimationEngine animateOpactiyOnForView:_sectionButton withDuration:0.2];
    }
}


@end


