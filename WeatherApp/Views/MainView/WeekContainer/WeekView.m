//
//  WeekView.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 14/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "WeekView.h"

@interface WeekView()

// UI outlets
@property (weak, nonatomic) IBOutlet UILabel *day1Name;
@property (weak, nonatomic) IBOutlet UIImageView *day1IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day1IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day2Name;
@property (weak, nonatomic) IBOutlet UIImageView *day2IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day2IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day3Name;
@property (weak, nonatomic) IBOutlet UIImageView *day3IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day3IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day4Name;
@property (weak, nonatomic) IBOutlet UIImageView *day4IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day4IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day5Name;
@property (weak, nonatomic) IBOutlet UIImageView *day5IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day5IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day6Name;
@property (weak, nonatomic) IBOutlet UIImageView *day6IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day6IconPM;

@property (weak, nonatomic) IBOutlet UILabel *day7Name;
@property (weak, nonatomic) IBOutlet UIImageView *day7IconAM;
@property (weak, nonatomic) IBOutlet UIImageView *day7IconPM;

@end




@implementation WeekView

// This method updates the UI outlets with the property values of a WeekViewModel object when assigned to the weekViewModel variable.
-(void)setWeekViewModel:(WeekViewModel *)weekViewModel {
    
    // set day 1 outlets
    [_day1Name setText:(weekViewModel.day1Name)];
    [_day1IconAM setImage:(weekViewModel.day1AMIcon)];
    [_day1IconPM setImage:(weekViewModel.day1PMIcon)];
    
    // set day 2 outlets
    [_day2Name setText:(weekViewModel.day2Name)];
    [_day2IconAM setImage:(weekViewModel.day2AMIcon)];
    [_day2IconPM setImage:(weekViewModel.day2PMIcon)];
    
    // set day 3 outlets
    [_day3Name setText:(weekViewModel.day3Name)];
    [_day3IconAM setImage:(weekViewModel.day3AMIcon)];
    [_day3IconPM setImage:(weekViewModel.day3PMIcon)];
    
    // set day 4 outlets
    [_day4Name setText:(weekViewModel.day4Name)];
    [_day4IconAM setImage:(weekViewModel.day4AMIcon)];
    [_day4IconPM setImage:(weekViewModel.day4PMIcon)];
    
    // set day 5 outlets
    [_day5Name setText:(weekViewModel.day5Name)];
    [_day5IconAM setImage:(weekViewModel.day5AMIcon)];
    [_day5IconPM setImage:(weekViewModel.day5PMIcon)];
    
    // set day 6 outlets
    [_day6Name setText:(weekViewModel.day6Name)];
    [_day6IconAM setImage:(weekViewModel.day6AMIcon)];
    [_day6IconPM setImage:(weekViewModel.day6PMIcon)];
    
    // set day 7 outlets
    [_day7Name setText:(weekViewModel.day7Name)];
    [_day7IconAM setImage:(weekViewModel.day7AMIcon)];
    [_day7IconPM setImage:(weekViewModel.day7PMIcon)];
    
}



@end
