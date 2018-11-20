//
//  SettingsViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationPickerViewController.h"
#import "TimePickerViewController.h"

@protocol SettingsDelegate <NSObject>
-(void)requestNewDataAndResetViewAfterSettingsChanged;
@end

// The SettingsViewController class handles lifecycle events for the 'settings' view of the application - including user interaction, management of pickerViews used to define user-settings data and storage of that data.
@interface SettingsViewController : UIViewController<LocationPickerDelegate, TimePickerDelegate>

// reference to the delegate class
@property (nonatomic, strong) IBOutlet id<SettingsDelegate> delegate;
@end




