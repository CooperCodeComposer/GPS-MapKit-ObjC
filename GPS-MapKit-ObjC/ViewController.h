//
//  ViewController.h
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/30/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>  

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    UILabel *xLocLabel;
    UILabel *yLocLabel;
    UILabel *headingLabel;
}

@property() CLLocationManager *manager;
@property() CLLocationDirection currentHeading;

@end

