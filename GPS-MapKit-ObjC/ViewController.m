//
//  ViewController.m
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/30/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLabels];
    
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    
  //  [self.manager requestAlwaysAuthorization];   // this is the request for background use
    [self.manager requestWhenInUseAuthorization];
    
    [self.manager startUpdatingLocation];
    
    [self startHeadingEvents];
    
}

- (void)setupLabels
{
    xLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 400, 100)];
    xLocLabel.text = @"x location";
    [xLocLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.view addSubview:xLocLabel];
    
    yLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 400, 100)];
    yLocLabel.text = @"y location";
    [yLocLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.view addSubview:yLocLabel];
    
    headingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 400, 100)];
    headingLabel.text = @"Heading";
    [headingLabel setFont:[UIFont systemFontOfSize:22]];
    
    [self.view addSubview:headingLabel];
    
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    CLLocation *current = [locations objectAtIndex:0];
    
    float lat = current.coordinate.latitude;
    float lon = current.coordinate.longitude;
    
    NSLog(@"lat:%f long:%f", lat, lon);
    
    // update text fields
    
    xLocLabel.text = [NSString stringWithFormat: @"Latitude = %.6f", lat];
    yLocLabel.text = [NSString stringWithFormat: @"Latitude = %.6f", lon];
    
        
}

-(void)updateHeadingDisplays
{
    NSLog(@"heading:%f", self.currentHeading);
    
    headingLabel.text = [NSString stringWithFormat: @"Heading = %f", self.currentHeading];
}

- (void)startHeadingEvents {
    
    /*
    // Start location services to get the true heading.
    
    self.manager.distanceFilter = 1000;
    
    self.manager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    [self.manager startUpdatingLocation];
    */
    
    
    // Start heading updates.
    
    if ([CLLocationManager headingAvailable]) {
        
        self.manager.headingFilter = 5;
        
        [self.manager startUpdatingHeading];
        
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    if (newHeading.headingAccuracy < 0)
        
        return;
    
    // Use the true heading if it is valid.
    
    CLLocationDirection theHeading = ((newHeading.trueHeading > 0) ?
                                       
                                       newHeading.trueHeading : newHeading.magneticHeading);
    
    self.currentHeading = theHeading;
    
    [self updateHeadingDisplays];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
