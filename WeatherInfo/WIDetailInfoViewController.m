//
//  WIDetailInfoController.m
//  WeatherInfo
//
//  Created by PCS MV on 2/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIDetailInfoViewController.h"

static NSString *const cellIdentifier = @"detailCell";

@interface WIDetailInfoViewController ()

@property (nonatomic, strong) NSArray *detailsCells;
@property (nonatomic, strong) NSArray *detailsCellsValue;

@end

@implementation WIDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.weatherData);
    
    WIWeatherData *weatherData = self.weatherData;

    UINib *nib = [UINib nibWithNibName:@"WITableViewCell" bundle:nil];
    [self.detailsTableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    
    [self configureScreenWithData:weatherData];
    
    [self configureMapView];
}


- (IBAction)tempSegmentSelected:(UISegmentedControl *)sender {
     WIWeatherData *weatherData = self.weatherData;
     NSNumber *tempInC = weatherData.tempC;
     NSNumber *tempInF = weatherData.tempF;
     self.temparatureLabel.text = (sender.selectedSegmentIndex == UISegmentedControlSegmentLeft) ? tempInC.stringValue: tempInF.stringValue;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.detailsCells count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    detailCell.nameLabel.text = [self.detailsCells objectAtIndex:indexPath.row];
    detailCell.valueLabel.text = [self.detailsCellsValue objectAtIndex:indexPath.row];
    return detailCell;
}

- (NSArray *)detailsCells {
    if (!_detailsCells) {
        _detailsCells = @[@"Dew Point",
                          @"Feels Like",
                          @"Relative Humidity",
                          @"Precipitation",
                          @"UV"];
    }
    return _detailsCells;
}


- (NSArray *)detailsCellsValue {
    if (!_detailsCellsValue) {
        WIWeatherData *weatherData = self.weatherData;
        _detailsCellsValue = @[weatherData.dewPoint,
                               weatherData.feelsLike,
                               weatherData.relativeHumidity,
                               weatherData.precipitation,
                               weatherData.UV];
    }
    return _detailsCellsValue;
}

- (void)configureScreenWithData:(WIWeatherData *)weatherData {
    [self.iconImageView setImageWithURL:weatherData.iconURL];
    self.cityLabel.text = weatherData.place;
    self.iconLabel.text = [weatherData.icon capitalizedString];
    self.windInfoLabel.text = weatherData.windInformation;
    self.temparatureLabel.text = [weatherData.tempF stringValue];
}

- (void)configureMapView {
    MKCoordinateRegion region;
    region.center.latitude = [self.weatherData.latitude doubleValue];
    region.center.longitude = [self.weatherData.longitude doubleValue];
    region.span.latitudeDelta = 1.0;
    region.span.longitudeDelta = 1.0;
    [self.mapView setRegion:region];
}

@end
