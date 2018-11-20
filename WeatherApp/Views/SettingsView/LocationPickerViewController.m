//
//  LocationPickerViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "LocationPickerViewController.h"

@interface LocationPickerViewController () {
    NSArray *_pickerData;
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end



@implementation LocationPickerViewController


// When the view has loaded this method calls to configure the PickerView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configurePickerView];
}


// This method configure the PickerView with data values and sets this view-controller as delegate and datasource. It also sets initial selection to the value passed to the view-controller's 'borough' variable during initialization
-(void)configurePickerView {
    
    // set pickerView data source and delegate
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    // set pickerView data values
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
    
    // set initial selection
    int index = [_pickerData indexOfObject: _borough];
    [self.picker selectRow:index inComponent:0 animated:NO];
}

// This method registers when the user has selected a new row in the pickerView and notifies the delegate class of the new location selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [_delegate locationPicked:(_pickerData[row]) forLocation:(NSString*)_locationName];
}

// This method returns the number of columns to be displayed in the pickerView
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// This method returns the number of rows to be displayed in the pickerView
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerData.count;
}

// This method configures the row titles in the pickerView
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerData[row];
}

// This method forces this viewController to be displayed modally
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}


@end
