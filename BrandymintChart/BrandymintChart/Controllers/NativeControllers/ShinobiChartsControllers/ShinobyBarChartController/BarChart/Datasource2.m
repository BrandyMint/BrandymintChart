//
//  Datasource.m
//  BarChart

#import "Datasource2.h"
#import "ShinobiChart+BarChart.h"

@implementation Datasource2

- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [_countriesAreaData dataKeys].count;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    
    return [chart barSeriesForKey:[[_countriesAreaData dataKeys] objectAtIndex:index]];
}

- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_countriesAreaData countries].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
    
    //map our data for our chart
    dp.yValue = [[_countriesAreaData countries] objectAtIndex:[_countriesAreaData countries].count - dataIndex - 1];
    dp.xValue = [[[_countriesAreaData data] objectForKey:dp.yValue] objectForKey:[[_countriesAreaData dataKeys] objectAtIndex:seriesIndex]];
    
    return dp;
}

@end
