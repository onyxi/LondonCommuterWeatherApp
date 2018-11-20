//
//  LoadingView.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 25/10/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()
@property(weak,nonatomic)IBOutlet UILabel*messageLabel;
@property(weak,nonatomic)IBOutlet UIActivityIndicatorView*activityIndicator;
@end


@implementation LoadingView

// This method show the LoadingView and start animating its UIActivityIndicatorView to show the app is working
-(void)show {
    self.hidden = NO;
    [_activityIndicator startAnimating];
}

// Thismethod hides the Loadingview and stops the UIActivityIndicatorView animating
-(void)hide {
    self.hidden = YES;
    [_activityIndicator stopAnimating];
}

@end
