//
//  TimePickerViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

// The TimePickerDelegate enables the TimePickerViewController class to notify the delegate class when a new time has been picked from the UIPickerView.
@protocol TimePickerDelegate <NSObject>
-(void)timePicked:(NSDate*)time for:(NSString*)timeName;
@end

// The TimePickerViewController class provides a simple pickerView used to indicate the start/end time of the am/pm journeys
@interface TimePickerViewController : UIViewController <UIPopoverPresentationControllerDelegate>

// references to hold the currently selected journey time, the name of the time being picked for (amStart/End or pmStart/End) and the delegate class
@property (weak, nonatomic) NSDate *time;
@property (weak, nonatomic) NSString *timeName;
@property (nonatomic, strong) IBOutlet id<TimePickerDelegate> delegate;

@end
