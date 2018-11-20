//
//  WeekDay.h
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeekDay : UIView
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *dayNameLbl;
@property (weak, nonatomic) IBOutlet UIImageView *amIcon;
@property (weak, nonatomic) IBOutlet UIImageView *pmIcon;

@end

