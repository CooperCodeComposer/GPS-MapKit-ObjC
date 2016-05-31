//
//  AppDelegate.h
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/30/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tab;
@property (strong, nonatomic) UITabBar *tabBar;

@property (strong, nonatomic) UIViewController *vc1;
@property (strong, nonatomic) TableViewController *vc2;


@end

