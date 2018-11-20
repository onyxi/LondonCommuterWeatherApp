//
//  LoadingView.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 25/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

// The LoadingView class provides a feedback display for the user while the app is working - with a text messge and activity indicator.
@interface LoadingView : UIView

// methods to show or hide the LoadingView
-(void)show;
-(void)hide;
@end
