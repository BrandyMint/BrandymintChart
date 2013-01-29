//
//  Datasource.h
//  BarChart

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "CountriesAreaData.h"

@interface Datasource2 : NSObject <SChartDatasource>
    
@property (nonatomic) id <CountriesAreaData> countriesAreaData;

@end
