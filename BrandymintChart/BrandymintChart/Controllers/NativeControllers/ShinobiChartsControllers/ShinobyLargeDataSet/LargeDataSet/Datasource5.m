//
//  Datasource.m
//  LargeDataSet

#import "Datasource5.h"
#import "ShinobiChart+LineChart.h"

@implementation Datasource5

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 1;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    return [chart seriesForKey:@""];
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_numberData data].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
    dp.xValue = [NSNumber numberWithInt:dataIndex];
    dp.yValue = [[_numberData data] objectAtIndex:dataIndex];
    return dp;
}

@end
