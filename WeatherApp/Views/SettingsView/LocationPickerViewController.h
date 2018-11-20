//
//  LocationPickerViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

// The LocationPickerDelegate enables the LocationPickerViewController class to notify the delegate class when a new location has been picked from the UIPickerView.
@protocol LocationPickerDelegate <NSObject>
-(void)locationPicked:(NSString*)borough forLocation:(NSString*)location;
@end

// The LocationPickerViewController class provides a simple pickerView with list of London boroughs used to indicate the location of the user's home and workplace.
@interface LocationPickerViewController : UIViewController <UIPopoverPresentationControllerDelegate, UIPickerViewDelegate>

// references to hold the currently selected London borough, the name of the location being picked for (home or work) and the delegate class
@property (weak, nonatomic) NSString *borough;
@property (weak, nonatomic) NSString *locationName;
@property (nonatomic, strong) IBOutlet id<LocationPickerDelegate> delegate;
@end
