//
//  ContainerViewController.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMSection.h"
#import "PMSection.h"
#import "AMSectionButton.h"
#import "PMSectionButton.h"

@interface ContainerViewController : UIViewController<AMSectionDelegate, PMSectionDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet AMSectionButton *amSectionBtn;
@property (weak, nonatomic) IBOutlet PMSectionButton *pmSectionBtn;

-(void)amSectionPressed;
-(void)pmSectionPressed;

@end


