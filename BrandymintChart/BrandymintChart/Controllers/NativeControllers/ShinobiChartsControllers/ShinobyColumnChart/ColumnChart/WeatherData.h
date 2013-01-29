//
//  WeatherData.h
//  ColumnChart

#import <Foundation/Foundation.h>

#define maxTemp @"max_temp"
#define minTemp @"min_temp"
#define meanTemp @"mean_temp"
#define rainfall @"rainfall"
#define sunshine @"sunshine"

//Our weather data must conform to this - our chart can then understand it
@protocol WeatherData <NSObject>

@required
- (NSArray*)months;
- (NSArray*)dataKeys;
- (NSMutableDictionary*)data;

@end
