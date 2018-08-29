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

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *homeLocationBtn;
@property (weak, nonatomic) IBOutlet UIButton *workLocationBtn;
@property (weak, nonatomic) IBOutlet UIButton *amStartBtn;
@property (weak, nonatomic) IBOutlet UIButton *amEndBtn;
@property (weak, nonatomic) IBOutlet UIButton *pmStartBtn;
@property (weak, nonatomic) IBOutlet UIButton *pmEndBtn;



- (IBAction)homeLocationPressed:(id)sender;
- (IBAction)workLocationPressed:(id)sender;
- (IBAction)amStartPressed:(id)sender;
- (IBAction)amEndPressed:(id)sender;
- (IBAction)pmStartPressed:(id)sender;
- (IBAction)pmEndPressed:(id)sender;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




- (void)showLocationPickerForLocation:(NSString*) locationName {
    LocationPickerViewController *locationPicker = [self.storyboard instantiateViewControllerWithIdentifier: @"LocationPickerViewController"];
    locationPicker.modalPresentationStyle = UIModalPresentationPopover;
    locationPicker.preferredContentSize = CGSizeMake(250, 150);
    
    UIPopoverPresentationController *popover = locationPicker.popoverPresentationController;
    popover.delegate = locationPicker;
    
    if ([locationName isEqualToString:(@"home")]) {
        popover.sourceView = self.homeLocationBtn;
    } else {
        popover.sourceView = self.workLocationBtn;
    }
    
    popover.sourceRect = CGRectMake(168,70,1,1);
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController:locationPicker animated:YES completion:nil];

}


- (void)showTimePickerForTime:(NSString*) timeName {
    TimePickerViewController *timePicker = [self.storyboard instantiateViewControllerWithIdentifier: @"TimePickerViewController"];
    timePicker.modalPresentationStyle = UIModalPresentationPopover;
    timePicker.preferredContentSize = CGSizeMake(160, 120);
    
    UIPopoverPresentationController *popover = timePicker.popoverPresentationController;
    popover.delegate = timePicker;
    
    if ([timeName isEqualToString:(@"amStart")]) {
        popover.sourceView = self.amStartBtn;
    } else if ([timeName isEqualToString:(@"amEnd")]){
        popover.sourceView = self.amEndBtn;
    } else if ([timeName isEqualToString:(@"pmStart")]){
        popover.sourceView = self.pmStartBtn;
    } else if ([timeName isEqualToString:(@"pmEnd")]){
        popover.sourceView = self.pmEndBtn;
    }
    
    popover.sourceRect = CGRectMake(61,65,1,1);
    popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    [self presentViewController: timePicker animated:YES completion:nil];
}


- (IBAction)homeLocationPressed:(id)sender {
    [self showLocationPickerForLocation:(@"home")];
}

- (IBAction)workLocationPressed:(id)sender {
    [self showLocationPickerForLocation:(@"work")];
}

- (IBAction)amStartPressed:(id)sender {
    [self showTimePickerForTime:(@"amStart")];
}

- (IBAction)amEndPressed:(id)sender {
    [self showTimePickerForTime:(@"amEnd")];
}

- (IBAction)pmStartPressed:(id)sender {
    [self showTimePickerForTime:(@"pmStart")];
}

- (IBAction)pmEndPressed:(id)sender {
    [self showTimePickerForTime:(@"pmEnd")];
}
@end
