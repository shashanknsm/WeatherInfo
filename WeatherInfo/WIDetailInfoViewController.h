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

@interface WIDetailInfoViewController : UIViewController

@property (nonatomic, strong) WIWeatherData *weatherData;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
