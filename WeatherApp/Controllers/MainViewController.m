//
//  ContainerViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "MainViewController.h"
#import "AnimationEngine.h"
#import "SettingsViewController.h"
#import "SectionButton.h"
#import "JourneyViewModel.h"
#import "WeekViewModel.h"
#import "WeatherApp-Swift.h"
#import "JourneyDetailsView.h"
#import "JourneyView.h"
#import "WeekView.h"
#import "LoadingView.h"


@interface MainViewController ()

// UI outlets
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dayViewXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weekViewXConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *amYConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pmYConstraint;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *swipeNavIndicatorImage;

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekViewDateLabel;

@property (weak, nonatomic) IBOutlet LoadingView *loadingView;


// instance properties
@property (weak, nonatomic) IBOutlet JourneyDetailsView *pmDetailsView;
@property (weak, nonatomic) IBOutlet JourneyDetailsView *amDetailsView;
@property (weak, nonatomic) IBOutlet JourneyView *amJourneyView;
@property (weak, nonatomic) IBOutlet JourneyView *pmJourneyView;
@property (weak, nonatomic) IBOutlet WeekView *weekView;

@property(strong,nonatomic)Constants*constants;

@end

@implementation MainViewController

// block-accessible flags to indicate showing/hiding journey details
BOOL showingAMDetails = FALSE;
BOOL showingPMDetails = FALSE;


// When the MainViewController loads this method sets up the view with gesture recognizers (to register user-taps), configures the amJourneyView and pmJourneyView subviews and updates the date/day labels to reflect the current date. Finally, a call is made to the 'getData' method to request new weather data.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addUpGestureRecognisers];
    [self configureJourneySectionViews];
    [self updateCurrentDateLabels];
    
    [self getData];
}


// This method configures the two JourneyView subviews with identification as either the "am" or "pm" journey, and assigns this MainViewController as their delegate in order to be notified when the user taps one of the JourneyViews.
-(void)configureJourneySectionViews {
    _amJourneyView.journeyViewName = @"am";
    _amJourneyView.delegate = self;
    
    _pmJourneyView.journeyViewName = @"pm";
    _pmJourneyView.delegate = self;
}



// This method updates the MainViewController's date/day labels to reflect the current date
-(void)updateCurrentDateLabels{
    
    // set dayLabel text to formatted String from current NSDate value - showing only the day name component
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE"];
    [_dayLabel setText: [formatter stringFromDate:[NSDate date]]];

    // set dateLabel text to formatted String from current NSDate value - in format '20 November 2018'
    [formatter setDateFormat:@"d MMMM yyyy"];
    [_dateLabel setText: [formatter stringFromDate:[NSDate date]]];
    [_weekViewDateLabel setText: [formatter stringFromDate:[NSDate date]]];
}



// This method uses the stored value of the user's home and work locations to make 4 calls to the Weatherbit.io api via the DataService class. Prior to each call, the request is configured so that one call is made to request each of the following: hourly forecasts for home location, hourly forecasts for work location, daily forecasts for home location, daily forecasts for work location. A dispatch group is used to ensure that all calls are completed before the returned data is used to instanciate the view-model objects which are assigned to subviews (2x JourneyView, 2x JourneyDetailsView and WeekView).
-(void)getData{
    
    // display loadingView to show the user that the app is working
    [_loadingView show];
    
    // get Location object representing the currently stored name of London borough for the user's home
    NSString*storedHomeLocation = [NSUserDefaults.standardUserDefaults objectForKey:Constants.instance.LOCATION_HOME];
    Location*homeLocation = Constants.instance.LOCATIONS[storedHomeLocation];
    
    // get Location object representing the currently stored name of London borough for the user's work
    NSString*storedWorkLocation = [NSUserDefaults.standardUserDefaults objectForKey:Constants.instance.LOCATION_WORK];
    Location*workLocation = Constants.instance.LOCATIONS[storedWorkLocation];
    
    // instanciate new DataService object and declare variables to hold references to api-call results
    DataService * dataService = [[DataService alloc] init];
    __block NSArray<Forecast*>*homeLocationForecasts = nil;
    __block NSArray<Forecast*>*workLocationForecasts = nil;
    __block NSArray<Forecast*>*homeLocationWeekAheadForecasts = nil;
    __block NSArray<Forecast*>*workLocationWeekAheadForecasts = nil;
    __block NSError *error = nil;
    

    // create new dispatch group
    dispatch_group_t dataServiceGroup = dispatch_group_create();
    
    // add new entry to dispatch group and make call to Weatherbit.io api for hourly forecast of home location using DataService class
    dispatch_group_enter(dataServiceGroup);
    [dataService configureRequestWithHourlyNotDaily:YES latitude:homeLocation.latitude longitude:homeLocation.longitude];
    [dataService fetchDataWithCompletionHandler:^(NSError * err, NSArray<Forecast*>* forecasts ) {
        // catch any errors
        error = error;
        // create AM journey view model
        homeLocationForecasts = forecasts;
        // leave dispatch group
        dispatch_group_leave(dataServiceGroup);
    }];
    
    // add new entry to dispatch group and make call to Weatherbit.io api for hourly forecast of work location using DataService class
    dispatch_group_enter(dataServiceGroup);
    [dataService configureRequestWithHourlyNotDaily:YES latitude:workLocation.latitude longitude:workLocation.longitude];
    [dataService fetchDataWithCompletionHandler:^(NSError * err, NSArray<Forecast*>* forecasts ) {
        // catch any errors
        error = error;
        // create PM journey view model
        workLocationForecasts = forecasts;
        // leave dispatch group
        dispatch_group_leave(dataServiceGroup);
    }];
    
    
    // add new entry to dispatch group and make call to Weatherbit.io api for daily forecast of home location using DataService class
    dispatch_group_enter(dataServiceGroup);
    [dataService configureRequestWithHourlyNotDaily:NO latitude:homeLocation.latitude longitude:homeLocation.longitude];
    [dataService fetchDataWithCompletionHandler:^(NSError * err, NSArray<Forecast*>* forecasts ) {
        // catch any errors
        error = error;
        // assign AM Week Ahead data
        homeLocationWeekAheadForecasts = forecasts;
        // leave dispatch group
        dispatch_group_leave(dataServiceGroup);
    }];
    
    // add new entry to dispatch group and make call to Weatherbit.io api for daily forecast of work location using DataService class
    dispatch_group_enter(dataServiceGroup);
    [dataService configureRequestWithHourlyNotDaily:NO latitude:workLocation.latitude longitude:workLocation.longitude];
    [dataService fetchDataWithCompletionHandler:^(NSError * err, NSArray<Forecast*>* forecasts ) {
        // catch any errors
        error = error;
        // assign PM Week Ahead data
        workLocationWeekAheadForecasts = forecasts;
        // leave dispatch group
        dispatch_group_leave(dataServiceGroup);
    }];
    
    
    // When all entries to dispatch group have left it, the group has completed and this block assigns new view-model objects to the JoureyView, JourneyDetailsView and WeekView subviews - instanciated with the data returned from the DataService class.
    dispatch_group_notify(dataServiceGroup,dispatch_get_main_queue(),^{
        
        // create and assign view-models for the am journey (JourneyViewModel and JourneyDetailsViewModel)
        _amJourneyView.journeyViewModel = [[JourneyViewModel alloc] initWithForecasts:homeLocationForecasts andJourneyTimeAMorPM:@"am"];
        _amDetailsView.journeyDetailsViewModel = [[JourneyDetailsViewModel alloc] initWithForecasts:homeLocationForecasts andJourneyTimeAMorPM:@"am"];
        
        // create and assign view-models for the pm journey (JourneyViewModel and JourneyDetailsViewModel)
        _pmJourneyView.journeyViewModel = [[JourneyViewModel alloc] initWithForecasts:workLocationForecasts andJourneyTimeAMorPM:@"pm"];
        _pmDetailsView.journeyDetailsViewModel = [[JourneyDetailsViewModel alloc] initWithForecasts:workLocationForecasts andJourneyTimeAMorPM:@"pm"];
        
        // create and assign view-model for the week-ahead view (WeekAheadViewModel)
        _weekView.weekViewModel = [[WeekViewModel alloc] initWithHomeLocationForecasts:homeLocationWeekAheadForecasts andWorkLocationForecasts:workLocationWeekAheadForecasts];
        
        // hid the loadingView message once the new data has been successfully loaded
        [_loadingView hide];
    });
    
}


// This method adds gesture-recognizers to the main view to register when the user swipes left or right
- (void) addUpGestureRecognisers {
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeContainerLeft:)];
    swipeLeft.delegate = self;
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_containerView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeContainerRight:)];
    swipeRight.delegate = self;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [_containerView addGestureRecognizer:swipeRight];
}

// This method uses the static AnimationEngine object to move the container views on/off screen. The main view(today's journeys) is moved off screen to the left and the week-view is moved onto the screen from the right
- (void) swipeContainerLeft:(UISwipeGestureRecognizer*)sender {
    [AnimationEngine animateConstraint:_dayViewXConstraint toValue:-UIScreen.mainScreen.bounds.size.width/2 withDuration:0.2 forView:self.view];
    [AnimationEngine animateConstraint:_weekViewXConstraint toValue:-UIScreen.mainScreen.bounds.size.width withDuration:0.2 forView:self.view];
    _swipeNavIndicatorImage.image = [UIImage imageNamed:@"swipeNavRight.png"];
}

// This method uses the static AnimationEngine object to move the container views on/off screen. The main view(today's journeys) is moved on screen from the left and the week-view is moved off the screen to the right
- (void) swipeContainerRight:(UISwipeGestureRecognizer*)sender {
    [AnimationEngine animateConstraint:_dayViewXConstraint toValue:0 withDuration:0.2 forView:self.view];
    [AnimationEngine animateConstraint:_weekViewXConstraint toValue: 0 withDuration:0.2 forView:self.view];
    _swipeNavIndicatorImage.image = [UIImage imageNamed:@"swipeNavLeft.png"];
}


// This method is called by a JourneyView subview and registers when the user has tapped that JourneyView. The method identifies the JourneyView that was tapped and then shows/hides the JourneyDetailsView corresponding to that journey by using the static AnimationEngine object to move the opposite JourneyView up/down to reveal the JourneyDetailsView beneath it.
- (void)journeyViewPressed:(NSString*)journeyViewName {
    
    // if 'am' JourneyView was tapped toggle its position and the color of it's SectionButton to better display the journey details
    if ([journeyViewName isEqualToString: @"am"]) {
        [_pmJourneyView toggleButtonColor];
        if (showingAMDetails) {
            [self hideDetailsForJourneyNamed:_amJourneyView.journeyViewName];
            showingAMDetails = FALSE;
        } else {
            [self showDetailsForJourneyNamed:_amJourneyView.journeyViewName];
            showingAMDetails = TRUE;
        }
    
    // if 'pm' JourneyView was tapped toggle its position and the color of it's SectionButton to better display the journey details
    } else if ([journeyViewName isEqualToString: @"pm"]) {
        [_amJourneyView toggleButtonColor];
        if (showingPMDetails) {
            [self hideDetailsForJourneyNamed:_pmJourneyView.journeyViewName];
            showingPMDetails = FALSE;
            _dayLabel.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1.0];
            _dateLabel.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1.0];
        } else {
            [self showDetailsForJourneyNamed:_pmJourneyView.journeyViewName];
            showingPMDetails = TRUE;
            _dayLabel.textColor = UIColor.whiteColor;
            _dateLabel.textColor = UIColor.whiteColor;
        }
    }
    
}

// This method shows the details for a given journey by moving the opposite journey's JourneyView to reveal the JourneyDetailsView beneath
-(void)showDetailsForJourneyNamed:(NSString*)journeyViewName {
    if ([journeyViewName isEqualToString:@"am"]) {
        [AnimationEngine animateConstraint:_pmYConstraint toValue: 191 withDuration:0.2 forView:self.view];
    } else if ([journeyViewName isEqualToString:@"pm"]) {
        [AnimationEngine animateConstraint:_amYConstraint toValue: -191 withDuration:0.2 forView:self.view];
    }
}

// This method hides the details for a given journey by moving the opposite journey's JourneyView to cover the exposed JourneyDetailsView beneath
-(void)hideDetailsForJourneyNamed:(NSString*)journeyViewName {
    if ([journeyViewName isEqualToString:@"am"]) {
        [AnimationEngine animateConstraint:_pmYConstraint toValue: 0 withDuration:0.2 forView:self.view];
    } else if ([journeyViewName isEqualToString:@"pm"]) {
        [AnimationEngine animateConstraint:_amYConstraint toValue: 0 withDuration:0.2 forView:self.view];
    }
}


// This method registers when the user taps on the 'Settings' button in the NavBar, and pushes the SettingsViewController onto the navigation controller - setting the MainViewController as its delegate in order to recieve notifications of changed data.
- (IBAction)settingsButtonPressed:(id)sender {
    SettingsViewController *settingsVC = [self.storyboard instantiateViewControllerWithIdentifier: @"SettingsViewController"];
    settingsVC.delegate = self;
    [self.navigationController pushViewController:settingsVC animated:YES];
}


// This method makes a call to request new data and resets the main view's layout (ensuring that today's journey views are presented - not the week view - and that the journey details are hidden) so it is ready for populating with newly fetched weather data .
-(void)requestNewDataAndResetViewAfterSettingsChanged {
    
    // request new data
    [self getData];
    
    // ensure today's journey views are presented - not the week view.
    [AnimationEngine animateConstraint:_dayViewXConstraint toValue:0 withDuration:0.2 forView:self.view];
    [AnimationEngine animateConstraint:_weekViewXConstraint toValue:375 withDuration:0.2 forView:self.view];
    _swipeNavIndicatorImage.image = [UIImage imageNamed:@"swipeNavLeft.png"];
    
    // ensure that journey details are hidden
    if (showingAMDetails) {
        [_pmJourneyView toggleButtonColor];
        [self hideDetailsForJourneyNamed:_amJourneyView.journeyViewName];
        showingAMDetails = FALSE;
    }
    if (showingPMDetails) {
        [_amJourneyView toggleButtonColor];
        [self hideDetailsForJourneyNamed:_pmJourneyView.journeyViewName];
        showingPMDetails = FALSE;
        _dayLabel.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1.0];
        _dateLabel.textColor = [UIColor colorWithRed:66/255 green:66/255 blue:66/255 alpha:1.0];
    }
    
}

@end
