//
//  WIHTTPSessionManager.m
//  WeatherInfo
//
//  Created by PCS MV on 2/27/16.
//  Copyright © 2016 personal. All rights reserved.
//

#import "WIHTTPSessionManager.h"

@implementation WIHTTPSessionManager


+ (WIHTTPSessionManager *)sharedManager {
    static WIHTTPSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:@" "]];
        sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    return sharedInstance;
}


- (void)fetchWeatherDataForZipCode:(NSString *)zipCode andOnSuccess:(SuccessBlock)success onFailure:(failureBlock)failure {
    [self GET:zipCode parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    }
    failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
}


@end
