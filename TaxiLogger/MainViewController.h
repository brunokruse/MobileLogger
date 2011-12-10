//
//  MainViewController.h
//  TaxiLogger
//
//  Created by Bruno Kruse on 12/9/11.
//  Copyright (c) 2011 BKLABS. All rights reserved.
//

#import "FlipsideViewController.h"
#import <MapKit/MapKit.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, MKMapViewDelegate> {

    IBOutlet MKMapView *mapView;
    
    IBOutlet UIButton  *startBtn; // start and stop
    IBOutlet UIButton  *resetBtn; // reset
    
    IBOutlet UITextView *logTxt;

}

// ui
@property (nonatomic, retain) UIButton *startBtn;
@property (nonatomic, retain) UIButton *resetBtn;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) UITextView *logTxt;

// actions
-(IBAction)startBtnPressed:(id)sender;
-(IBAction)resetBtnPressed:(id)sender;

// mapping
-(void)observeValueForKeyPath:(NSString *)keyPath  
                     ofObject:(id)object  
                       change:(NSDictionary *)change  
                      context:(void *)context;

// /feeds/41598

@end
