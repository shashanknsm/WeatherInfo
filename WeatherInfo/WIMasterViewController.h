//
//  ViewController.h
//  WeatherInfo
//
//  Created by PCS MV on 2/25/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WIHTTPSessionManager.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "WIWeatherData.h"

@interface WIMasterViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITableView *zipTableView;


@end

