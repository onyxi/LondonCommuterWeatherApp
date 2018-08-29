//
//  LocationPickerViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "LocationPickerViewController.h"

@interface LocationPickerViewController ()
{
    NSArray *_pickerData;
}
@end

@implementation LocationPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerData = @[
        @"Camden",
        @"Chelsea",
        @"Greenwich",
        @"Hackney",
        @"Hammersmith",
        @"Islington",
        @"Kensington",
        @"Lambeth",
        @"Lewisham",
        @"Southwark",
        @"Tower Hamlets",
        @"Wandsworth",
        @"Westminster"
    ];
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;

}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


@end
