//
//  WeekDayView.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "WeekDayView.h"

@interface WeekDayView ()
@property (strong, nonatomic) IBOutlet WeekDayView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *dayNameLbl;
@property (weak, nonatomic) IBOutlet UIImageView *amIcon;
@property (weak, nonatomic) IBOutlet UIImageView *pmIcon;



@end

@implementation WeekDayView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void) customInit {
    [[NSBundle mainBundle] loadNibNamed:@"WeekDay" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

@end
