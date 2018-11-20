//
//  WeekView.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeekViewModel.h"

NS_ASSUME_NONNULL_BEGIN

// The WeekView class displays weather summary icons for AM and PM journey times over the week ahead
@interface WeekView : UIView

// reference to view-model object
@property(strong,nonatomic)WeekViewModel*weekViewModel;

@end

NS_ASSUME_NONNULL_END
