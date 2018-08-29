//
//  AMSection.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AMSectionDelegate <NSObject>
-(void)amSectionPressed;
@end

@interface AMSection : UIView
- (IBAction)amSectionPressed:(id)sender;
@property (nonatomic, strong) IBOutlet id<AMSectionDelegate> delegate;

@end
