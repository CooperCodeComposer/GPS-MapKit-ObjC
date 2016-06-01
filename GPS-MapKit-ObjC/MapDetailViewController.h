//
//  MapDetailViewController.h
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/31/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapDetailViewController : UIViewController<MKMapViewDelegate>

@property(nonatomic, assign) MKMapView *mapView;


@end
