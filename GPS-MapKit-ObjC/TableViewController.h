//
//  TableViewController.h
//  GPS-MapKit-ObjC
//
//  Created by Alistair Cooper on 5/30/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "MapDetailViewController.h"

@interface TableViewController : UITableViewController
{
    NSMutableArray *restaurantsArray;
    NSMutableArray *restaurantCatArray;
    
}

@property (strong, nonatomic) MapDetailViewController *vcDetail;


@end
