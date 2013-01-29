//
//  Datasource.m
//  ColumnChart

#import "Datasource3.h"
#import "ShinobiChart+columnChart.h"

@implementation Datasource3

//Map our data keys to series indexes
- (NSString*)keyForIndex:(int)index {
    NSString *key = nil;
    
    //this mapping determines which series are drawn first - ie:behind
    switch (index) {
        case 0:
            key = rainfall;
            break;
        case 1:
            key = sunshine;
            break;
        case 2:
            key = minTemp;
            break;
        case 3:
            key = maxTemp;
            break;
        case 4:
            key = meanTemp;
            break;
        default:
            break;
    }
    return key;
}

//Implement methods from SChartDatasource
- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return [_weatherdata dataKeys].count;
}

- (SChartSeries*)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    return [chart weatherSeriesForKey:[self keyForIndex:index]];
}

- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    return [_weatherdata months].count;
}

- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    SChartDataPoint *dp = [SChartDataPoint new];
    dp.xValue = [[_weatherdata months] objectAtIndex:dataIndex];
    
    if ([[self keyForIndex:seriesIndex] isEqualToString:sunshine]) {
        // we use the data value for the radius - this value is presentation only
        dp.yValue = [NSNumber numberWithInt:40];
        
    } else if ([[self keyForIndex:seriesIndex] isEqualToString:maxTemp]) {
        // max temp is stacked on top of min temp. - remove the min temp offset
        NSNumber *min = [[[_weatherdata data] objectForKey:dp.xValue] objectForKey:minTemp];
        NSNumber *max = [[[_weatherdata data] objectForKey:dp.xValue] objectForKey:maxTemp];
        dp.yValue = [NSNumber numberWithFloat:max.floatValue - min.floatValue];
        
    } else {
        dp.yValue = [[[_weatherdata data] objectForKey:dp.xValue] objectForKey:[self keyForIndex:seriesIndex]];
    }
    
    
    return dp;
}

- (SChartAxis*)sChart:(ShinobiChart *)chart yAxisForSeriesAtIndex:(int)index {
    if ([[self keyForIndex:index] isEqualToString:rainfall]) {
        return chart.yAxis;
    }
    return [[chart allYAxes] lastObject];
}

- (float)sChartRadiusForDataPoint:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    if ([[self keyForIndex:seriesIndex] isEqualToString:sunshine]) {
        float radiusModifier = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 8.f : 11.f;
        return [[[[_weatherdata data] objectForKey:[[_weatherdata months] objectAtIndex:dataIndex]] objectForKey:[self keyForIndex:seriesIndex]] floatValue] / radiusModifier;
    }
    return 0.f;
}




@end
