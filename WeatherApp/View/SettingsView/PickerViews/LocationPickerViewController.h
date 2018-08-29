//
//  LocationPickerViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 26/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationPickerViewController : UIViewController <UIPopoverPresentationControllerDelegate, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
