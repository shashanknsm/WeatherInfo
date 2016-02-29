//
//  WIWeatherData.h
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface WIWeatherData : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *place;
@property (nonatomic, copy, readonly) NSString *zip;
@property (nonatomic, copy, readonly) NSString *relativeHumidity;
@property (nonatomic, copy, readonly) NSString *windInformation;
@property (nonatomic, copy, readonly) NSString *windDirection;
@property (nonatomic, copy, readonly) NSString *feelsLike;
@property (nonatomic, copy, readonly) NSString *visibility;
@property (nonatomic, copy, readonly) NSString *UV;
@property (nonatomic, copy, readonly) NSString *precipitation;
@property (nonatomic, copy, readonly) NSString *dewPoint;
@property (nonatomic, copy, readonly) NSString *icon;

@property (nonatomic, strong, readonly) NSNumber *windSpeed;
@property (nonatomic, strong, readonly) NSNumber *tempC;
@property (nonatomic, strong, readonly) NSNumber *tempF;

@property (nonatomic, strong, readonly) NSDate *currentDate;
@property (nonatomic, strong, readonly) NSURL *iconURL;

@property (nonatomic, copy, readonly) NSString *latitude;
@property (nonatomic, copy, readonly) NSString *longitude;

+ (NSDateFormatter *)dateFormatter;

@end
