//
//  JourneyView.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JourneyViewModel.h"
#import "JourneyView.h"

NS_ASSUME_NONNULL_BEGIN

// The JourneyViewDelegate protocol allows a JourneyView object to notify its delegate when it is tapped by the user.
@protocol JourneyViewDelegate <NSObject>
-(void)journeyViewPressed:(NSString*)journeyViewName;
@end


// The JourneyView class displays summarised weather data for a given journey - either AM or PM
@interface JourneyView : UIView

// view-identification property
@property(strong,nonatomic)NSString*journeyViewName;

// references to delegate and view-model objects
@property (strong, nonatomic) id<JourneyViewDelegate> delegate;
@property(strong,nonatomic)JourneyViewModel*journeyViewModel;
-(void)toggleButtonColor;

@end

NS_ASSUME_NONNULL_END
