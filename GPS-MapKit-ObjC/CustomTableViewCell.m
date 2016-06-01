//
//  CustomTableViewCell.m
//  ParsingJSON-ObjC
//
//  Created by Alistair Cooper on 5/15/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize categoryLabel = _categoryLabel;
@synthesize priceLabel = _priceLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
