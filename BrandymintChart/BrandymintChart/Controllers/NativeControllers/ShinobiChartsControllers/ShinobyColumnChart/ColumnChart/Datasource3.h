//
//  Datasource.h
//  ColumnChart

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "WeatherData.h"

@interface Datasource3 : NSObject <SChartDatasource>

@property (nonatomic) id<WeatherData> weatherdata;

@end
