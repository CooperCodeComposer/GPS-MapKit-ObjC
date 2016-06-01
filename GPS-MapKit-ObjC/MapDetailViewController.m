//
//  MapDetailViewController.m
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/31/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "MapDetailViewController.h"
#import "TableViewController.h"
#import "AppDelegate.h"

@interface MapDetailViewController ()

@end

@implementation MapDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.showsScale = YES;
    
    [self.view addSubview:self.mapView];
    
    // set the zoom scale
    
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (                               userLocation.location.coordinate, 20000, 20000);
    [self.mapView setRegion:region animated:NO];
    
    // get variables from AppDelegate
    AppDelegate *theAppDelegate = (AppDelegate*) [UIApplication sharedApplication].delegate;
    
    double lat = theAppDelegate.currentRestaurantLat;
    double lon = theAppDelegate.currentRestaurantLon;
    
    NSLog(@"Lat float string = %f", lat);
    NSLog(@"Lon float string = %f", lon);
    
    
    
    // place the pin for the current resturant
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    
    
    // Place a single pin
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    [annotation setTitle:@"Restaurant"]; //You can set the subtitle too
    [self.mapView addAnnotation:annotation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapView delegate methods
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation: (MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
