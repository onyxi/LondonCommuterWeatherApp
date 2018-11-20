//
//  SettingsViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "SettingsViewController.h"
#import "LocationPickerViewController.h"
#import "TimePickerViewController.h"
#import "WeatherApp-Swift.h"

@interface SettingsViewController ()

// UI outlets
@property (weak, nonatomic) IBOutlet UIButton *homeLocationBtn;
@property (weak, nonatomic) IBOutlet UIButton *workLocationBtn;
@property (weak, nonatomic) IBOutlet UIButton *amStartBtn;
@property (weak, nonatomic) IBOutlet UIButton *amEndBtn;
@property (weak, nonatomic) IBOutlet UIButton *pmStartBtn;
@property (weak, nonatomic) IBOutlet UIButton *pmEndBtn;
@property (weak, nonatomic) IBOutlet UILabel *homeBoroughLabel;
@property (weak, nonatomic) IBOutlet UILabel *workBoroughLabel;
@property (weak, nonatomic) IBOutlet UILabel *amStartLabel;
@property (weak, nonatomic) IBOutlet UILabel *amEndLabel;
@property (weak, nonatomic) IBOutlet UILabel *pmStartLabel;
@property (weak, nonatomic) IBOutlet UILabel *pmEndLabel;

// instance methods
- (IBAction)homeLocationPressed:(id)sender;
- (IBAction)workLocationPressed:(id)sender;
- (IBAction)amStartPressed:(id)sender;
- (IBAction)amEndPressed:(id)sender;
- (IBAction)pmStartPressed:(id)sender;
- (IBAction)pmEndPressed:(id)sender;

// instance properties
@property (weak, nonatomic) NSString *homeLocation;
@property (weak, nonatomic) NSString *workLocation;
@property (weak, nonatomic) NSDate *amStart;
@property (weak, nonatomic) NSDate *amEnd;
@property (weak, nonatomic) NSDate *pmStart;
@property (weak, nonatomic) NSDate *pmEnd;

@end



@implementation SettingsViewController

// When the SettingsViewCOntroller loads this method gets the currently stored values for the user's journey details and updates the UILabel outlets with those retrieved values.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // get stored journey details
    _homeLocation = [[NSUserDefaults standardUserDefaults] stringForKey: Constants.instance.LOCATION_HOME];
    _workLocation = [[NSUserDefaults standardUserDefaults] stringForKey:Constants.instance.LOCATION_WORK];
    _amStart = [[NSUserDefaults standardUserDefaults] objectForKey:Constants.instance.AM_START];
    _amEnd = [[NSUserDefaults standardUserDefaults] objectForKey:Constants.instance.AM_END];
    _pmStart = [[NSUserDefaults standardUserDefaults] objectForKey:Constants.instance.PM_START];
    _pmEnd = [[NSUserDefaults standardUserDefaults] objectForKey:Constants.instance.PM_END];
    
    // update UILabel outlets
    [self updateLabels];
}


// This method updates the UILabel outlets to reflect the values of the class's corresponding instance properties
-(void)updateLabels {
    _homeBoroughLabel.text = _homeLocation;
    _workBoroughLabel.text = _workLocation;
    _amStartLabel.text = [self getStringForDate: _amStart];
    _amEndLabel.text = [self getStringForDate: _amEnd];
    _pmStartLabel.text = [self getStringForDate: _pmStart];
    _pmEndLabel.text = [self getStringForDate: _pmEnd];
}


// This method returns a formatted NSString that represents a given NSDate - in 24hr time format (HH:MM)
-(NSString*)getStringForDate:(nullable NSDate*)date {
    // get time components from given date
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    // construct 24hr-format NSString using time components
    NSString* hourString;
    if (hour > 9) {
        hourString = [@(hour) stringValue];
    } else {
        hourString = [NSString stringWithFormat: @"0%@", [@(hour) stringValue]];
    }
    NSString* minuteString;
    if (minute > 9) {
        minuteString = [@(minute) stringValue];
    } else {
        minuteString = [NSString stringWithFormat: @"0%@", [@(minute) stringValue]];
    }
    NSString *timeString = [NSString stringWithFormat: @"%@:%@", hourString, minuteString];
    return timeString;
}



// This method displays a LocationPickerViewController configured to represent the user's home or work location
- (void)showLocationPickerForLocation:(NSString*) locationName {
    
    // instanciate LocationPickerViewController for given journey (locationName of "home" or "work")
    LocationPickerViewController *locationPicker = [self.storyboard instantiateViewControllerWithIdentifier: @"LocationPickerViewController"];
    locationPicker.modalPresentationStyle = UIModalPresentationPopover;
    locationPicker.preferredContentSize = CGSizeMake(250, 150);
    locationPicker.delegate = self;
    locationPicker.locationName = locationName;
    
    // display popover view and position it pointing to the journey location it is associated with.
    UIPopoverPresentationController *popover = locationPicker.popoverPresentationController;
    popover.delegate = locationPicker;
    if ([locationName isEqualToString:(@"home")]) {
        popover.sourceView = self.homeLocationBtn;
        locationPicker.borough = _homeLocation;
    } else {
        popover.sourceView = self.workLocationBtn;
        locationPicker.borough = _workLocation;
    }
    popover.sourceRect = CGRectMake(168,70,1,1);
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:locationPicker animated:YES completion:nil];

}



// This method displays a TimePickerViewController configured to represent either the start or end of the user's home or work journey
- (void)showTimePickerForTime:(NSString*) timeName {
    
    // instanciate TimePickerViewController for given journey start/end (timeName of "amStart" / "amEnd" / "pmStart" / "pmEnd")
    TimePickerViewController *timePicker = [self.storyboard instantiateViewControllerWithIdentifier: @"TimePickerViewController"];
    timePicker.modalPresentationStyle = UIModalPresentationPopover;
    timePicker.preferredContentSize = CGSizeMake(160, 120);
    timePicker.delegate = self;
    timePicker.timeName = timeName;

    // display popover view and position it pointing to the journey start/end it is associated with.
    UIPopoverPresentationController *popover = timePicker.popoverPresentationController;
    popover.delegate = timePicker;
    if ([timeName isEqualToString:(@"amStart")]) {
        popover.sourceView = self.amStartBtn;
        timePicker.time = _amStart;
    } else if ([timeName isEqualToString:(@"amEnd")]){
        popover.sourceView = self.amEndBtn;
        timePicker.time = _amEnd;
    } else if ([timeName isEqualToString:(@"pmStart")]){
        popover.sourceView = self.pmStartBtn;
        timePicker.time = _pmStart;
    } else if ([timeName isEqualToString:(@"pmEnd")]){
        popover.sourceView = self.pmEndBtn;
        timePicker.time = _pmEnd;
    }
    popover.sourceRect = CGRectMake(61,65,1,1);
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController: timePicker animated:YES completion:nil];
}


// This method registers when the user taps the home location UILabel and requests to display a LocationPickerViewController for the home location
- (IBAction)homeLocationPressed:(id)sender {
    [self showLocationPickerForLocation:(@"home")];
}


// This method registers when the user taps the work location UILabel and requests to display a LocationPickerViewController for the work location
- (IBAction)workLocationPressed:(id)sender {
    [self showLocationPickerForLocation:(@"work")];
}


// This method registers when the user taps the am journey start-time UILabel and requests to display a TimePickerViewController for that time
- (IBAction)amStartPressed:(id)sender {
    [self showTimePickerForTime:(@"amStart")];
}


// This method registers when the user taps the am journey end-time UILabel and requests to display a TimePickerViewController for that time
- (IBAction)amEndPressed:(id)sender {
    [self showTimePickerForTime:(@"amEnd")];
}


// This method registers when the user taps the pm journey start-time UILabel and requests to display a TimePickerViewController for that time
- (IBAction)pmStartPressed:(id)sender {
    [self showTimePickerForTime:(@"pmStart")];
}


// This method registers when the user taps the pm journey end-time UILabel and requests to display a TimePickerViewController for that time
- (IBAction)pmEndPressed:(id)sender {
    [self showTimePickerForTime:(@"pmEnd")];
}



// This method is called by a LocationPickerViewController to notify that a new location has been picked. The method captures the new value and stores it in NSUserDefaults, and then calls the 'updateLabels' method so the SettingsViewController's UILabels reflect the new values
-(void)locationPicked:(NSString*)borough forLocation:(NSString*)location {
    
    // identify location that the new value was picked for and assign/store appropriately
    if ([location isEqualToString:@"home"]) {
        _homeLocation = borough;
        [[NSUserDefaults standardUserDefaults] setValue: borough forKey:Constants.instance.LOCATION_HOME];
    } else if ([location isEqualToString:@"work"]) {
        _workLocation = borough;
        [[NSUserDefaults standardUserDefaults] setValue: borough forKey:Constants.instance.LOCATION_WORK];
    }
    
    // update UILabels to reflect new data
    [self updateLabels];
}



// This method is called by a TimePickerViewController to notify that a new time has been picked. The method captures the new value and stores it in NSUserDefaults, and then calls the 'updateLabels' method so the SettingsViewController's UILabels reflect the new values
-(void)timePicked:(NSDate*)time for:(NSString*)timeName {
    
    // identify journey start/end that the new value was picked for and assign/store appropriately
    if ([timeName isEqualToString:@"amStart"]) {
        _amStart = time;
        [[NSUserDefaults standardUserDefaults] setValue: time forKey:Constants.instance.AM_START];
    } else if ([timeName isEqualToString:@"amEnd"]) {
        _amEnd = time;
        [[NSUserDefaults standardUserDefaults] setValue: time forKey:Constants.instance.AM_END];
    } else if ([timeName isEqualToString:@"pmStart"]) {
        _pmStart = time;
        [[NSUserDefaults standardUserDefaults] setValue: time forKey:Constants.instance.PM_START];
    } else if ([timeName isEqualToString:@"pmEnd"]) {
        _pmEnd = time;
        [[NSUserDefaults standardUserDefaults] setValue: time forKey:Constants.instance.PM_END];
    }
    
    // update UILabels to reflect new data
    [self updateLabels];
}



// This method registers when the user presses the 'Done' button and notifies the delegate (MainViewController) that the user has updated their journey settings so it should reset the view layout and request new weather data, before dismissing the SettingsViewController
- (IBAction)donePressed:(id)sender {
    [_delegate requestNewDataAndResetViewAfterSettingsChanged];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
