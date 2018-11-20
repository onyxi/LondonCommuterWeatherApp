//
//  JourneyDetailsView.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JourneyDetailsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

// The JourneyDetailsView class displays hourly weather forecast data for a given journey - either AM or PM
@interface JourneyDetailsView : UIView

// reference to view-model object
@property(strong,nonatomic)JourneyDetailsViewModel*journeyDetailsViewModel;

@end

NS_ASSUME_NONNULL_END
