//
//  WIHTTPSessionManager.h
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <MTLModel.h>
#import "WIWeatherData.h"

typedef void(^SuccessBlock)(WIWeatherData *weatherData);
typedef void(^failureBlock)(NSError *error);


@interface WIHTTPSessionManager : AFHTTPSessionManager

+ (WIHTTPSessionManager *)sharedManager;

- (void)fetchWeatherDataForZipCode:(NSString *)zipCode andOnSuccess:(SuccessBlock)success onFailure:(failureBlock)failure;



@end
