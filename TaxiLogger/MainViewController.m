//
//  MainViewController.m
//  TaxiLogger
//
//  Created by Bruno Kruse on 12/9/11.
//  Copyright (c) 2011 BKLABS. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize startBtn;
@synthesize resetBtn;
@synthesize mapView;
@synthesize logTxt;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // show our blue orb
    mapView.showsUserLocation = YES;
    
    [self.mapView.userLocation addObserver:self  
                                forKeyPath:@"location"  
                                   options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld)  
                                   context:NULL];
    
    // we should turn the userLoc into a string first
    float locLat = self.mapView.userLocation.coordinate.latitude;
    float locLong = self.mapView.userLocation.coordinate.longitude;
    
    
    // create a string out of the user location
    NSString *userLocString = [NSString stringWithFormat:@"%f, %f", locLat, locLong];
    
    logTxt.text = [logTxt.text stringByAppendingFormat: @"Initial Location: %@", userLocString];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.mapView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark
#pragma mark - Button Actions

-(void)startBtnPressed:(id)sender 
{    
    // grab the user location and append to the textView
    float locLat = self.mapView.userLocation.coordinate.latitude;
    float locLong = self.mapView.userLocation.coordinate.longitude;
    
    NSString *userLocString = [NSString stringWithFormat:@"%f, %f", locLat, locLong];
    NSLog(@"%f", locLat);
    NSLog(@"%@", userLocString);
    
    logTxt.text = [logTxt.text stringByAppendingFormat: @"\nUpdated Location: %@", userLocString];
    
    // autoscroll text to latest entry
    NSRange range = NSMakeRange(logTxt.text.length - 1, 1);
    [logTxt scrollRangeToVisible:range];

}

-(void)resetBtnPressed:(id)sender 
{
    // clear the log
    logTxt.text = @"";

}

#pragma mark
#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark
#pragma mark - Mapping Methods

-(void)observeValueForKeyPath:(NSString *)keyPath  
                     ofObject:(id)object  
                       change:(NSDictionary *)change  
                      context:(void *)context {  
    
    // zoom
    MKCoordinateRegion region;
    region.center = self.mapView.userLocation.coordinate;  
    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];

    // center
    MKCoordinateSpan span; 
    span.latitudeDelta  = 0; // Change these values to change the zoom
    span.longitudeDelta = 0; 
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    
    // finally log
    // logTxt.text = [logTxt.text stringByAppendingFormat: @"\n%@", self.mapView.userLocation.coordinate];
}

@end
