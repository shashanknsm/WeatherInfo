//
//  WIWeatherData.h
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <Foundation/Foundation.h>

@interface WIWeatherData : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *place;
@property (nonatomic, copy, readonly) NSString *zip;
@property (nonatomic, assign, readonly) NSNumber *tempC;
@property (nonatomic, assign, readonly) NSNumber *tempF;
@property (nonatomic, assign, readonly) NSString *relativeHumidity;
@property (nonatomic, copy, readonly) NSString *windInformation;
@property (nonatomic, copy, readonly) NSString *windDirection;
//@property (nonatomic, assign, readonly) NSString *windSpeed;
@property (nonatomic, copy, readonly) NSString *feelsLike;
@property (nonatomic, copy, readonly) NSString *visibility;
@property (nonatomic, copy, readonly) NSString *UV;
@property (nonatomic, copy, readonly) NSString *precipitation;
@property (nonatomic, copy, readonly) NSString *dewPoint;
@property (nonatomic, strong, readonly) NSDate *currentDate;

+ (NSDateFormatter *)dateFormatter;

@end
