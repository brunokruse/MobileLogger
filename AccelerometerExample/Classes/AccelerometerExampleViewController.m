//
//  AccelerometerExampleViewController.m
//  AccelerometerExample
//
//

#import "AccelerometerExampleViewController.h"

@implementation AccelerometerExampleViewController
@synthesize x_slider;
@synthesize y_slider;
@synthesize z_slider;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // grab the accelerometer
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.updateInterval = 0.05f; // .05 what does this actually mean?
    accel.delegate = self;
    
    // setup the sliders
    x_slider.minimumValue = -1;
    x_slider.maximumValue = 1;

    y_slider.minimumValue = -1;
    y_slider.maximumValue = 1;
    
    z_slider.minimumValue = -1;
    z_slider.maximumValue = 1;
    
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // log some stuff
    NSLog(@"(%.02f, %.02f, %.02f)", acceleration.x, acceleration.y, acceleration.z);
    
    // set our slider values
    x_slider.value = acceleration.x;
    y_slider.value = acceleration.y;
    z_slider.value = acceleration.z;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [x_slider release];
    [y_slider release];
    [z_slider release];

    [super dealloc];
}

@end
