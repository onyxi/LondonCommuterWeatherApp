//
//  PMSection.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PMSectionDelegate <NSObject>
-(void)pmSectionPressed;
@end

@interface PMSection : UIView
- (IBAction)pmSectionPressed:(id)sender;
@property (nonatomic, strong) IBOutlet id<PMSectionDelegate> delegate;

@end
