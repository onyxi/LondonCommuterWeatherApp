//
//  ContainerViewController.m
//  WeatherApp
//
//  Created by Pete Holdsworth on 24/03/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

#import "ContainerViewController.h"
#import "AnimationEngine.h"

@interface ContainerViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dayViewXConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *weekViewXConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *amYConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pmYConstraint;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ContainerViewController

BOOL showingAMDetails = FALSE;
BOOL showingPMDetails = FALSE;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeContainerLeft:)];
    swipeLeft.delegate = self;
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_containerView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeContainerRight:)];
    swipeRight.delegate = self;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [_containerView addGestureRecognizer:swipeRight];
}


- (void) swipeContainerLeft:(UISwipeGestureRecognizer*)sender {
    [AnimationEngine animateConstraint:_dayViewXConstraint toValue:-375 withDuration:0.2 forView:self.view];
    [AnimationEngine animateConstraint:_weekViewXConstraint toValue:0 withDuration:0.2 forView:self.view];
}

- (void) swipeContainerRight:(UISwipeGestureRecognizer*)sender {
    [AnimationEngine animateConstraint:_dayViewXConstraint toValue:0 withDuration:0.2 forView:self.view];
    [AnimationEngine animateConstraint:_weekViewXConstraint toValue:375 withDuration:0.2 forView:self.view];
}

-(void)amSectionPressed {
    [self toggleAMDetails];
}

-(void)pmSectionPressed {
    [self togglePMDetails];
}

-(void) toggleAMDetails {
    if (showingAMDetails) {
        [AnimationEngine animateConstraint:_pmYConstraint toValue:0 withDuration:0.2 forView:self.view];
        showingAMDetails = FALSE;
        [_pmSectionBtn animateOpacityOff];
    } else {
        [AnimationEngine animateConstraint:_pmYConstraint toValue:-191 withDuration:0.2 forView:self.view];
        showingAMDetails = TRUE;
        [_pmSectionBtn animateOpacityOn];
    }
}

-(void) togglePMDetails {
    if (showingPMDetails) {
        [AnimationEngine animateConstraint:_amYConstraint toValue:0 withDuration:0.2 forView:self.view];
        showingPMDetails = FALSE;
        [_amSectionBtn animateOpacityOff];
    } else {
        [AnimationEngine animateConstraint:_amYConstraint toValue:-191 withDuration:0.2 forView:self.view];
        showingPMDetails = TRUE;
        [_amSectionBtn animateOpacityOn];
    }
}

@end
