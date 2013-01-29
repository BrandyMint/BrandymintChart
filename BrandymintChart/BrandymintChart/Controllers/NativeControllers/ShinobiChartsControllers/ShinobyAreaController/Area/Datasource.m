//
//  Datasource.m
//  Area


#import "Datasource.h"
#import "ShinobiChart+AreaChart.h"

@implementation Datasource

- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [_medalData dataKeys].count;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    return [chart areaSeriesForKey:[[_medalData dataKeys] objectAtIndex:index]];
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_medalData countries].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
    dp.xValue = [[_medalData countries] objectAtIndex:dataIndex];
    dp.yValue = [[[_medalData data] objectForKey:dp.xValue] objectForKey:[[_medalData dataKeys] objectAtIndex:2-seriesIndex]];
    return dp;
}

@end














