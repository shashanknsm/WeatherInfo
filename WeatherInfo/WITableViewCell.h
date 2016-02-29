//
//  WITableViewCell.h
//  WeatherInfo
//
//  Created by PCS MV on 2/28/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WITableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
