//
//  AccelerometerExampleAppDelegate.h
//  AccelerometerExample
//
//


#import <UIKit/UIKit.h>

@class AccelerometerExampleViewController;

@interface AccelerometerExampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerExampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerExampleViewController *viewController;

@end

