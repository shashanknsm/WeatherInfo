//
//  WIHTTPSessionManager.m
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIHTTPSessionManager.h"

static NSString* const baseURL = @"http://api.wunderground.com/api/69e67fdea2aebbe7/conditions/q/CA/";

@implementation WIHTTPSessionManager


+ (WIHTTPSessionManager *)sharedManager {
    static WIHTTPSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    return sharedInstance;
}


- (void)fetchWeatherDataForZipCode:(NSString *)zipCode andOnSuccess:(SuccessBlock)success onFailure:(failureBlock)failure {
    [self GET:zipCode parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        NSError *error = nil;
        WIWeatherData *weather = [MTLJSONAdapter modelOfClass:[WIWeatherData class] fromJSONDictionary:responseObject[@"current_observation"] error:&error];
        NSLog(@"%@",error);
        success(weather);
    }
    failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}


@end
