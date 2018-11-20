//
//  TimePickerViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "TimePickerViewController.h"

@interface TimePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;

@end


@implementation TimePickerViewController

// When the view has loaded this method calls to configure the PickerView
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurePickerView];
}

// This method sets the selection of the pickerView to reflect the currently selected time (as passed into the 'time' variable during initialization)
-(void)configurePickerView {
    if (_time != nil) {
        [_timePicker setDate:_time];
    }
}

// This method registers when the user has selected a new row in the pickerView and notifies the delegate class of the new time selection
- (IBAction)timePickerValueChanged:(id)sender {
    [_delegate timePicked:_timePicker.date for: _timeName];
}

// This method forces this viewController to be displayed modally
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}


@end
