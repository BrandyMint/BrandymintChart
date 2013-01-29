//
//  Datasource.h
//  LineChart

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "BrowserUsageStats.h"

@interface Datasource6 : NSObject <SChartDatasource>

@property (nonatomic) id<BrowserUsageStats> browserUsageStats;

@end
