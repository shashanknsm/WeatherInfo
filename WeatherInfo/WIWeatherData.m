//
//  WIWeatherData.m
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIWeatherData.h"

//"local_time_rfc822":"Fri, 26 Feb 2016 19:00:17 -0800"
@implementation WIWeatherData

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"place":@"display_location.full",
        @"zip":@"display_location.zip",
        @"tempC":@"temp_c",
        @"tempF":@"temp_f",
        @"relativeHumidity":@"relative_humidity",
        @"windInformation":@"wind_string",
        @"windDirection":@"wind_dir",
        @"dewPoint":@"dewpoint_string",
        @"windSpeed":@"wind_mph",
        @"feelsLike":@"feelslike_string",
        @"visibility":@"visibility_mi",
        @"UV":@"UV",
        @"precipitation":@"precip_1hr_string",
        @"currentDate":@"local_time_rfc822",
        @"icon":@"icon",
        @"iconURL":@"icon_url"
    };
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss -z";
    return dateFormatter;
}

+ (NSValueTransformer *)currentDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
            return [[self dateFormatter]dateFromString:dateString];
    }

    reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
            return [[self dateFormatter]stringFromDate:date];
    }];
}

+ (NSValueTransformer *)iconURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}


@end
