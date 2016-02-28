//
//  WIDetailInfoController.m
//  WeatherInfo
//
//  Created by PCS MV on 2/26/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIDetailInfoViewController.h"

@interface WIDetailInfoViewController ()

@end

@implementation WIDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.weatherData);
    [self.iconImageView setImageWithURL:self.weatherData.iconURL];
}

 

@end
