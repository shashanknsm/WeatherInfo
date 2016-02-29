//
//  WIDetailInfoController.h
//  WeatherInfo
//
//  Created by PCS MV on 2/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WIWeatherData.h"
#import <UIImageView+AFNetworking.h>
#import "WITableViewCell.h"
#import <MapKit/MapKit.h>

@interface WIDetailInfoViewController : UIViewController 

@property (nonatomic, strong) WIWeatherData *weatherData;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
@property (weak, nonatomic) IBOutlet UILabel *temparatureLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
