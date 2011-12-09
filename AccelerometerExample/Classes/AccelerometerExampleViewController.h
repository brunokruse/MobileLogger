//
//  AccelerometerExampleViewController.h
//  AccelerometerExample
//
//

#import <UIKit/UIKit.h>

@interface AccelerometerExampleViewController : UIViewController<UIAccelerometerDelegate> {
    
	IBOutlet UISlider *x_slider;
    IBOutlet UISlider *y_slider;
    IBOutlet UISlider *z_slider;

}

@property (nonatomic, retain)  UISlider *x_slider;
@property (nonatomic, retain)  UISlider *y_slider;
@property (nonatomic, retain)  UISlider *z_slider;

@end

