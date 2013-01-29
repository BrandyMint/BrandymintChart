//
//  UKWeatherData.h
//  ColumnChart

#import <Foundation/Foundation.h>
#import "WeatherData.h"

//Our UK weather data to be used by the datasource
@interface UKWeatherData : NSObject <WeatherData>

@property (nonatomic,readonly) NSMutableDictionary *data;
@property (nonatomic,readonly) NSArray *dataKeys;
@property (nonatomic,readonly) NSArray *months;

@end
