//
//  CustomTableViewCell.h
//  ParsingJSON-ObjC
//
//  Created by Alistair Cooper on 5/15/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property(weak, nonatomic) IBOutlet UILabel *priceLabel;


@end
